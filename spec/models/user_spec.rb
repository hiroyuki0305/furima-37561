require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '会員情報入力' do
    context 'ユーザ登録ができる時' do
      it '全ての項目に問題がない' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録が出来ない時' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'パスワードとパスワード(確認)が不一致では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'お名前(全角)の苗字が空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'お名前(全角)の名前が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'お名前カナ(全角)の苗字が空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'お名前カナ(全角)の名前が空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it '生年月日が空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birth date can't be blank"
      end

      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'email.com'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
      end

      it 'パスワードが6文字未満では登録できない' do
        @user.password = '111aa'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '１１１aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end

      it 'お名前(全角)の苗字に半角文字が含まれていると登録できない' do
        @user.last_name = 'ﾐｮｳｼ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end

      it 'お名前(全角)の名前に半角文字が含まれていると登録できない' do
        @user.first_name = 'ﾅﾏｴ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end

      it 'お名前(全角)の苗字に半角文字が含まれていると登録できない' do
        @user.last_name_kana = '苗字みょうじmyouji123'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana is invalid'
      end

      it 'お名前(全角)の名前に半角文字が含まれていると登録できない' do
        @user.first_name_kana = '名前なまえnamae123'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana is invalid'
      end
    end
  end
end
