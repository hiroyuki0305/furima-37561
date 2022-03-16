class PurchaserShipping
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id,:item_id
  attr_accessor :token
  
    validates :token, presence: true
    validates :user_id,:item_id, presence: true
    validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: " is invalid. Enter it as follows (e.g. 123-4567"}
    validates :prefecture_id, presence: true, numericality: {other_than: 1, message: "can't be blank"}
    validates :city, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
    validates :addresses, presence: true
    validates :phone_number, presence: true, format: {with: /\A\d{10,11}\z/, message: "is too short"}
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is invalid. Input only number"}

  def save
    purchaser = Purchaser.create(user_id: user_id,item_id: item_id)
    Shipping.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, phone_number: phone_number, building: building, purchaser_id: purchaser.id)
  end

end
