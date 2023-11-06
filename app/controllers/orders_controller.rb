class OrdersController < ApplicationController
  def create
    order_service = OrderService.new(current_cart)
    order_service.perform
    flash.now[:success] = 'Order successfully placed'
  rescue StandardError => e
    redirect_to products_path, flash: { error: e.message }
  end

  def index
    @orders = Order.includes(order_products: [:product]).page(params[:page]).per(params[:per_page])
  end

  def notifications
  end
end