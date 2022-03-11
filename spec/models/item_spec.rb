require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の情報を入力' do
    context '商品情報を入力ができる時' do
      it '全ての項目に問題がない' do
        expect(@item).to be_valid
      end
    end

    context '商品情報を入力ができない時' do
      it '商品画像でファイル選択をされていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品名が空では登録できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end

      it 'カテゴリーが選択されていない場合は登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態が選択されていない場合は登録できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Sales status can't be blank"
      end

      it '配送料の負担が選択されていない場合は登録できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee status can't be blank"
      end

      it '発送元の地域が選択されていない場合は登録できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end

      it '発送までの日数が選択されていない場合は登録できない' do
        @item.scheduled_deliver_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled deliver can't be blank"
      end

      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が半角数字以外では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Price is out of setting range'
      end
    end
  end
end
