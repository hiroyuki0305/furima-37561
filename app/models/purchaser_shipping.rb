class PurchaserShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id,:item_id

  with_options presence: true do
    validates :user_id,:item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    purchaser = Purchaser.create(user_id: user_id,item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, phone_number: phone_number, building: building, purchaser_id: purchaser.id)
  end

end
