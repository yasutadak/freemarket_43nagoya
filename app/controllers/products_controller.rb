class ProductsController < ApplicationController

  def index
    @products = Product.order("created_at DESC").limit(3)
  end

  def new
  end
end
