require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it '名字と名前がそれぞれ必須であること' do
      @user.first_name = ''
      @user.last_name = ''
      @user.first_name_kana = ''
      @user.last_name_kana = ''
      @user.valid?
      expect(@user).to be_invalid
      expect(@user.errors[:first_name]).to include("can't be blank")
      expect(@user.errors[:last_name]).to include("can't be blank")
      expect(@user.errors[:first_name_kana]).to include("can't be blank")
      expect(@user.errors[:last_name_kana]).to include("can't be blank")
    end
    it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'aa'
      @user.last_name = 'aa'
      @user.valid?
      expect(@user).to be_invalid
      expect(@user.errors[:first_name]).to include("is invalid")
      expect(@user.errors[:last_name]).to include("is invalid")
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.first_name_kana = 'aa'
      @user.last_name_kana = 'aa'
      @user.valid?
      expect(@user).to be_invalid
      expect(@user.errors[:first_name_kana]).to include("is invalid")
      expect(@user.errors[:last_name_kana]).to include("is invalid")
    end


    it '生年月日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it '重複したemailが存在する場合は登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'testmail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    
    it '半角英字のみのパスワードは無効であること' do
      @user = FactoryBot.build(:user, password: 'password', password_confirmation: 'password')
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '半角数字のみのパスワードは無効であること' do
      @user = FactoryBot.build(:user, password: '123456', password_confirmation: '123456')
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
  end
end