class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :category

  belongs_to :user
  
  validates :item_name, :content, :category_id, :condition_id, :shipping_fee_burden_id, 
            :prefecture_id, :shipping_duration_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
      
  
end
