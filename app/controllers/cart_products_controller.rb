class CartProductsController < ApplicationController
  before_action :set_cart_product, only: [:destroy, :update]

  def update
    @cart_product.update(permitted_params)
  end

  def create
    product = Product.find(params[:cart_product][:product_id])
    cart_product = CartProduct.find_or_initialize_by(product_id: product.id)
    cart_product.quantity = params[:cart_product][:quantity].to_i
    cart_product.persisted? ? cart_product.save : current_cart.cart_products << cart_product
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