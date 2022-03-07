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

  end
end
