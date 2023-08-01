class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address_information, :building_name,
                :telephone_number,:user_id, :item_id, :token

  validates :municipalities, :address_information, 
            :user_id, :item_id, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "please enter in the format of 3 digits, hyphens and 4 digits" }
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "please enter a half-width number between 10 and 11 digits" }
  validates :token, presence: true
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }


  def save
  order = Order.create(user_id: user_id, item_id: item_id)
  address = Address.create(
    postal_code: postal_code,
    prefecture_id: prefecture_id,
    municipalities: municipalities,
    address_information: address_information,
    building_name: building_name,
    telephone_number: telephone_number,
    order_id: order.id)
  end
end
