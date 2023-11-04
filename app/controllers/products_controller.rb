class ProductsController < ApplicationController
  def index
    query = Product.includes(:store).where(["name LIKE ?","%#{params[:name]}%"])
    query = query.where(store_id: params[:store_id]) if params[:store_id].present?

    @products = query.page(params[:page]).per(params[:per_page])
    @stores = Store.all
  end
end