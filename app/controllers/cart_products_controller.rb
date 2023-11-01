class CartProductsController < ApplicationController
  before_action :set_cart_product, only: [:destroy]

  
  def create
    cart_product = CartProduct.new(permitted_params)
    cart_product.product = Product.find(params[:cart_product][:product_id])
    current_cart.cart_products << cart_product
  end

  def destroy
    @cart_product.destroy
  end

  private

  def permitted_params
    params.require(:cart_product).permit(:quantity)
  end

  def set_cart_product
    @cart_product = current_cart.cart_products.find(params[:id])
  end
end