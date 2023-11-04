class OrderService
  attr_accessor :order

  def initialize(cart)
    @cart = cart
  end

  def perform
    ActiveRecord::Base.transaction do
      @order = Order.new
      @cart.cart_products.each do |cart_product|
        @order.order_products.build(product: cart_product.product, quantity: cart_product.quantity)
      end

      @order.save!
    end

    after_perform
  end

  private

  def after_perform
    @cart.destroy

    broadcast_to_product_channel
    broadcast_to_inventory_monitor_channel
  end

  def broadcast_to_product_channel
    ActionCable.server.broadcast(
      "products",
      products: @order.order_products.map { |order_product| order_product.product.as_json(only: [:id, :available]) }
    )
  end

  def broadcast_to_inventory_monitor_channel
    ActionCable.server.broadcast(
      "inventory_monitor",
      order_products: @order.order_products.map { |order_product| order_product.as_json(include: { product: { include: { store: { only: [:name] } } } }) }
    )
  end
end