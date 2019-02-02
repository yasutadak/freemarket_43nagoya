class ProductsController < ApplicationController

  def index
    render layout: "header-top"
  end

  def new
    render layout: "header-logo"
  end
end
