class StoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.page(params[:page]).per(params[:per_page])
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(permitted_params)
    if @store.save
      redirect_to stores_path, flash: { success: 'Store successfully created' }
    else
      flash.now[:error] = @store.errors.full_messages.join('<br>').html_safe
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @store.update(permitted_params)
      redirect_to stores_path, flash: { success: 'Store successfully updated' }
    else
      flash.now[:error] = @store.errors.full_messages.join('<br>').html_safe
      render :edit
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path, flash: { success: 'Store successfully deleted' }
  end

  private

  def permitted_params
    params.require(:store).permit(:name)
  end

  def set_store
    @store = Store.find(params[:id])
  end
end