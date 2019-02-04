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
  end
end
