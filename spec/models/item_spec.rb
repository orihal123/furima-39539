require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '必要な情報を適切に入力して「出品する」ボタンを押すと、商品情報がデータベースに保存されること。' do
    context '商品を出品できない場合' do
      
      it '商品画像を1枚つけることが必須であること。' do  
        expect(@item).not_to be_valid
        expect(@item.errors[:image]).to include("can't be blank")
      end     
      
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Item name can't be blank")
      end

      it 'カテゴリーの情報が空では登録できない' do
        @item.category_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Category can't be blank")
      end

      it '商品の状態の情報が空では登録できない' do
        @item.condition_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Condition can't be blank")
      end

      it '配送料の負担の情報が空では登録できない' do
        @item.shipping_fee_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping fee burden can't be blank")
      end

      it '発送元の地域の情報が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Prefecture can't be blank")
      end

      it '発送までの日数の情報が空では登録できない' do
        @item.shipping_duration_id  = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Shipping duration can't be blank")
      end
      
      it '価格の情報が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include ("Price can't be blank")
      end
    end

    context '価格は、¥300~¥9,999,999の間のみ保存可能であること。' do
      
      it '価格は、¥300以下では登録できない' do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格は9,999,999以上では登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end

    context '価格は半角数値以外は登録できない。' do
      it '半角数値の場合は登録できること' do
        @item.price = "500"
        @item.valid?
      end

      it '半角数値以外の場合は登録できないこと' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end  

    end
  end
end




