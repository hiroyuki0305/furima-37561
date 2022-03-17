require 'rails_helper'

RSpec.describe PurchaserShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchaser_shipping = FactoryBot.build(:purchaser_shipping, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  describe '購入内容の確認を入力' do
    context '購入内容の確認入力ができる時' do
      it '全ての項目に問題がない' do
        expect(@purchaser_shipping).to be_valid
      end

      it '建物名が空でも登録ができる' do
        @purchaser_shipping.building = ''
        expect(@purchaser_shipping).to be_valid
      end
      
    end

    context '購入内容の確認入力ができない時' do
      it '郵便番号が空では登録できない' do
        @purchaser_shipping.postal_code = ''
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "Postal code can't be blank"
      end

      it '郵便番号が半角数字でないと登録できない' do
        @purchaser_shipping.postal_code = '０９０１２３４５６７８'
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include 'Postal code  is invalid. Enter it as follows (e.g. 123-4567'
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと登録できない' do
        @purchaser_shipping.postal_code = '1234567'
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include 'Postal code  is invalid. Enter it as follows (e.g. 123-4567'
      end

      it '都道府県が空では登録できない' do
        @purchaser_shipping.prefecture_id = nil
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '都道府県に「---」が選択されている場合は登録できない' do
        @purchaser_shipping.prefecture_id = '1'
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '市区町村が空では登録できない' do
        @purchaser_shipping.city = ''
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "City can't be blank"
      end

      it '番地が空では登録できない' do
        @purchaser_shipping.addresses = ''
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "Addresses can't be blank"
      end

      it '電話番号が空では登録できない' do
        @purchaser_shipping.phone_number = ''
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "Phone number can't be blank"
      end

      it '電話番号が半角数字でないと登録できない' do
        @purchaser_shipping.phone_number = '０９０１２３４５６７８'
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end

      it '電話番号にハイフンが入っていると登録できない' do
        @purchaser_shipping.phone_number = '-'
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include 'Phone number is invalid. Input only number'
      end

      it '電話番号が10桁未満では登録できない' do
        @purchaser_shipping.phone_number = '123456789'
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include 'Phone number are within 10 to 11 digits'
      end

      it '電話番号が12桁以上では登録できない' do
        @purchaser_shipping.phone_number = '090123456789'
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include 'Phone number are within 10 to 11 digits'
      end

      it 'トークンが空では登録できない' do
        @purchaser_shipping.token = nil
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "Token can't be blank"
      end

      it 'userが紐付いていなければ保存できない' do
        @purchaser_shipping.user_id = nil
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "User can't be blank"
      end

      it 'itemが紐付いていなければ保存できない' do
        @purchaser_shipping.item_id = nil
        @purchaser_shipping.valid?
        expect(@purchaser_shipping.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
