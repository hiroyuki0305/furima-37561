class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :sales_status_id
  belongs_to :shipping_fee_status_id
  belongs_to :prefecture_id
  belongs_to :scheduled_deliver_id

  with_options presence: true do
  validates :name, :info, :price, :user
  
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_deliver_id,
  numericality: { other_than: 1 ,message: "can't be blank"}
  end

  has_one_attached :image
end
