class ProductsController < ApplicationController

  def index
    @products = Product.order("id DESC").limit(3)
  end

  def list
    @products = Product.order("id DESC").page(params[:page]).per(12)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def edit
    @product = find_product_id
  end

  def update
    @product = find_product_id
    @product.update(product_params)
    redirect_to product_path
  end

  def show
    @product = find_product_id
    @products = Product.where(seller_id: @product.seller).where.not(id: @product.id).order("id DESC").limit(6)
  end

  private

  def product_params
    params.require(:product).permit(:name, :status, :shipping_method, :shipping_burden, :region, :shipping_timetable, :price, :description, :image, :image_cache).merge(seller_id: current_user.id)
  end

  def find_product_id
    Product.find(params[:id])
  end
end
