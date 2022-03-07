require 'rails_helper'

RSpec.describe User, type: :model do
  describe '会員情報入力' do
    it 'ニックネームが空では登録できない' do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'メールアドレスが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include "Email can't be blank"
    end

    it 'パスワードが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include "Password can't be blank"
    end

    it 'パスワード(確認)が空では登録できない' do
      user = FactoryBot.build(:user)
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include "Password confirmation can't be blank"
    end

    it 'お名前(全角)の苗字が空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'お名前(全角)の名前が空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include "First name can't be blank"
    end

    it 'お名前カナ(全角)の名前が空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'お名前カナ(全角)の名前が空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include "First name kana can't be blank"
    end

    it '生年月日が空では登録できない' do
      user = FactoryBot.build(:user)
      user.birth_date = ''
      user.valid?
      expect(user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end
