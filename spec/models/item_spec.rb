require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '商品出品できる場合' do
      it '必須項目が存在し適切な形式なら出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do
      it '商品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it '商品の説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空では出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category は必須項目です。')
      end
      it 'カテゴリーに「1」が選択されている場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category は必須項目です。')
      end
      it '商品の状態が空では出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition は必須項目です。')
      end
      it '商品の状態に「1」が選択されている場合は出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition は必須項目です。')
      end
      it '配送料の負担が空では出品できない' do
        @item.charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge は必須項目です。')
      end
      it '配送料の負担に「1」が選択されている場合は出品できない' do
        @item.charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Charge は必須項目です。')
      end
      it '発送元の地域が空では出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture は必須項目です。')
      end
      it '発送元の地域に「1」が選択されている場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture は必須項目です。')
      end
      it '発送までの日数が空では出品できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Day は必須項目です。')
      end
      it '発送までの日数に「1」が選択されている場合は出品できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day は必須項目です。')
      end
      it '価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9999999を超えると出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が全角では出品できない' do
        @item.price = 'かかくテスト'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格がアルファベットでは出品できない' do
        @item.price = 'abcdefg'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
