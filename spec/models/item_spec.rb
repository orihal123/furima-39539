require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

    # 画像のテスト用のファイルパスを指定
    test_image_path = Rails.root.join('spec', 'fixtures', 'test_image.jpg')
    test_image = Rack::Test::UploadedFile.new(test_image_path, 'image/jpeg')
    @item.image = test_image # テスト用の画像を直接代入
  end

  describe '商品出品機能' do
    context '全ての項目が入力されていれば出品できる'

    it '全ての項目が入力されていれば出品できる' do
      expect(@item).to be_valid
    end
  end

  context '商品を出品できない場合' do
    it '商品画像が空では出品出来ない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空では出品できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end

    it '商品説明が空では出品できない' do
      @item.content = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Content can't be blank")
    end

    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態に「---」が選択されている場合は出品できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end

    it '配送料の負担に「---」が選択されている場合は出品できない' do
      @item.shipping_fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
    end

    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日数に「---」が選択されている場合は出品できない' do
      @item.shipping_duration_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping duration can't be blank")
    end

    it '価格が空では出品できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円未満では出品できない' do
      @item.price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
    end

    it '価格が9_999_999円を超えると出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
    end

    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.price = '1２345'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not a number')
    end

    it 'ユーザーが紐付いていなければ投稿できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
