class ProductsController < ApplicationController
  def index
    @products = Product.where(["name LIKE ?","%#{params[:name]}%"]).page(params[:page]).per(params[:per_page])
  end
end