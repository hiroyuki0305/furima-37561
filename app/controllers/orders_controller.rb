class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :url, only: [:index, :create]

  def index
    @purchaser_shipping = PurchaserShipping.new
  end

  def create
    @purchaser_shipping = PurchaserShipping.new(purchaser_params)
    if @purchaser_shipping.valid?
      pay_item
      @purchaser_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_shipping).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number, :building)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchaser_params[:token],
      currency: 'jpy'
    )
  end

  def url
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.purchaser.present?
  end
end
