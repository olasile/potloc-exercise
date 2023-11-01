class OrdersController < ApplicationController
  before_action :authenticate_admin!, only: [:index]
  def create
    order_service = OrderService.new(current_cart)

    if order_service.perform
      current_cart.destroy
      flash.now[:success] = 'Order successfully placed'
    else
      redirect_to products_path, flash: { error: order_service.order.errors.full_messages.join('<br>').html_safe }
    end
  end

  def index
    @orders = Order.includes(order_products: [:product]).page(params[:page]).per(params[:per_page])
  end
end