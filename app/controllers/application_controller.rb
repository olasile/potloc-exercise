class ApplicationController < ActionController::Base
  helper_method :current_cart

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end
