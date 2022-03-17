class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_deliver

  with_options presence: true do
    validates :image, :name, :info
    validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_deliver_id,
              numericality: { other_than: 1, message: "can't be blank" }
    validates :price, format: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  end

  belongs_to :user
  has_one :purchaser
  has_one_attached :image
end
