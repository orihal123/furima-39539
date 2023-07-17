class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname,:first_name, :last_name, :first_name_kana, :last_name_kana,:birthday, 
         presence: true
         validates :password, length: { minimum: 6 }

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: { with: VALID_PASSWORD_REGEX }

         validates :first_name, presence: true, format: { with: /\A[一-龯ぁ-んァ-ン]+\z/ }
         validates :last_name, presence: true, format: { with: /\A[一-龯ぁ-んァ-ン]+\z/ }
         validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
         validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
end
