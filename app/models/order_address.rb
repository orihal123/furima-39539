class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address_information, :building_name,
                :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipalities, :address_information, :user_id, :item_id, :token
    validates :postal_code,
              format: { with: /\A\d{3}-\d{4}\z/, message: 'please enter in the format of 3 digits, hyphens and 4 digits' }
    validates :telephone_number,
              format: { with: /\A\d{10,11}\z/, message: 'please enter a half-width number between 10 and 11 digits' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  end

  def save
    order = Order.create(user_id:, item_id:)
    address = Address.create(
      postal_code:,
      prefecture_id:,
      municipalities:,
      address_information:,
      building_name:,
      telephone_number:,
      order_id: order.id
    )
  end
end
