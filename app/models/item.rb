class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :category

  belongs_to :user
  
  validates :item_name, :content, :category_id, :condition_id, :shipping_fee_burden_id, 
            :prefecture_id, :shipping_duration_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true }

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :shipping_fee_burden_id, numericality: { other_than: 1 , message: "can't be blank"}
      
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_fee_burden
end

