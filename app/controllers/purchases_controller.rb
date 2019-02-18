class PurchasesController < ApplicationController

  before_action :set_product, only: [:show, :update]
  before_action :set_card,    only: [:show, :update]

  def show
    @user = User.find(current_user.id)
  end

  def update
    ActiveRecord::Base.transaction do
      charge = Payjp::Charge.create(
        currency: "jpy",
        amount:   @product.price,
        customer: current_user.id
      )
    @product.update!(buyer_id: current_user.id)
    end
  end

private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_card
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.retrieve(id: current_user.id.to_s)
    @card = customer.cards.data[0]
  end

end
