require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能の保存' do
    before do
      user = FactoryBot.create(:user) # 適切なユーザーを作成
      item = FactoryBot.create(:item) # 適切な商品を作成

      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end

    context '商品購入をすることができる' do

      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid

      end
    end

    context '商品購入をすることができない' do
      it 'postal_codeが空だと保存できないこと' do
        @order_address.postal_code = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'postal_codeが3桁ハイフン4桁の半角文字列のみ保存可能' do
        @order_address.postal_code = '1111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code please enter in the format of 3 digits, hyphens and 4 digits")
        
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'municipalitiesが空だと保存できないこと' do
        @order_address.municipalities = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      
      it 'address_informationが空だと保存できないこと' do
        @order_address.address_information = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address information can't be blank")
      end

      it 'telephone_numberが空だと保存できないこと' do
        @order_address.telephone_number = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")

      end
      it 'telephone_numberが10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @order_address.telephone_number = '11'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone number please enter a half-width number between 10 and 11 digits')
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end



