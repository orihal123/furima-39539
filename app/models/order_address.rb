class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:municipalities,:address_information,:building_name,
                :telephone_number, :user_id, :item_id, :order_id

  # ここにバリデーションの処理を書く
  validates :prefecture_id,:municipalities,:address_information,:building_name,
            :user_id, :item_id,                   presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{3}-\d{4}\z/, message: "は3桁ハイフン4桁の形式で入力してください" }
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数値で入力してください" }

  def save
    # 寄付情報を保存し、変数donationに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    # donation_idには、変数donationのidと指定する
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address_information: address_information, 
      building_name: building_name, telephone_number: telephone_number, user_id: user_id, item_id:item_id, order_id:order_id)
  end
end