class ProductsController < ApplicationController

  def index
    @products = Product.order("created_at DESC").limit(3)
  end

  def list
    @products = Product.order("created_at DESC").page(params[:page]).per(12)
  end

  def new
  end

  def show
    @product = Product.find(params[:id])
    @products = Product.where(seller_id: @product.seller).where.not(id: @product.id).order("created_at DESC").limit(6)
  end
end
