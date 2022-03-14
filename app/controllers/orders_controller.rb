class OrdersController < ApplicationController
 
  def index
    @item = Item.find(params[:item_id])
    @purchaser_shipping = PurchaserShipping.new
  end

  def new
  end

  def create
    @purchaser_shipping = PurchaserShipping.new(purchaser_params)
    if @purchaser_shipping.valid?
      @purchaser_shipping.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def purchaser_params
    params.require(:purchaser_shipping).permit(:postal_code, :prefecture_id, :city, :addresses, :phone_number, :building).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
