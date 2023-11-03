require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  describe '商品の購入' do
    before do
      item = FactoryBot.create(:item)
      user = FactoryBot.create(:user)
      @record_address = FactoryBot.build(:record_address, item_id: item.id, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@record_address).to be_valid
      end
      it 'apartmentは空でも保存できること' do
        @record_address.apartment = ''
        expect(@record_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @record_address.post_code = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @record_address.post_code = '0000000'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと保存できないこと' do
        @record_address.prefecture_id = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefectureに"---"が選択されていると保存できないこと' do
        @record_address.prefecture_id = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @record_address.municipalities = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @record_address.block = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'telephoneが空だと保存できないこと' do
        @record_address.telephone = ''
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが10桁未満と保存できないこと' do
        @record_address.telephone = '000000000'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone is invalid.')
      end
      it 'telephoneが12桁以上と保存できないこと' do
        @record_address.telephone = '000000000000'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone is invalid.')
      end
      it 'telephoneに半角数字以外が含まれている場合は購入できないこと' do
        @record_address.telephone = 'a0000000000'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Telephone is invalid.')
      end
      it 'tokenが空では登録できないこと' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @record_address.item_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
