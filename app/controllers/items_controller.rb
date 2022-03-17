class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :common, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id || @item.purchaser.present?
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id,
                                 :shipping_fee_status_id, :prefecture_id, :scheduled_deliver_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def common
    @item = Item.find(params[:id])
  end
end
