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
        @order_address.building_name = nil
        expect(@order_address).to be_valid

      end
    end

    context '商品購入をすることができない' do
      it 'postal_codeが空だと保存できないこと' do
      end
      it 'postal_codeが3桁ハイフン4桁の半角文字列のみ保存可能' do
      end
      it 'prefectureを選択していないと保存できないこと' do
      end
      it 'municipalitiesが空だと保存できないこと' do
      end
      it 'address_informationが空だと保存できないこと' do
      end
      it 'telephone_numberが空だと保存できないこと' do
      end
      it 'telephone_numberが10桁以上11桁以内の半角数値のみ保存可能なこと' do
      end
      it 'userが紐付いていないと保存できないこと' do
      end
    end
  end
end



