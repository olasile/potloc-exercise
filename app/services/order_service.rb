class OrderService
  attr_accessor :order

  def initialize(cart)
    @cart = cart
  end

  def perform
    @order = Order.new
    @cart.cart_products.each do |cart_product|
      @order.order_products.build(product: cart_product.product, quantity: cart_product.quantity)
    end

    @order.save
  end
end