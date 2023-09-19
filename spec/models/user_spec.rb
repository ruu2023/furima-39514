require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、surnameとname、surname_kanaとname_kana、birthdayが存在し適切な形式なら登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
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
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが129文字以上では登録できない' do
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it 'passwordがアルファベットだけでは登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は半角英数を両方含む必要があります')
      end
      it '名字が空では登録できない' do
        @user.surname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname can't be blank")
      end
      it '名前が空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it '名字カナが空では登録できない' do
        @user.surname_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname kana can't be blank")
      end
      it '名前カナが空では登録できない' do
        @user.name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana can't be blank")
      end
      it '名字がアルファベットでは登録できない' do
        @user.surname = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname は全角ひらがな、全角カタカナ、漢字でご入力下さい。')
      end
      it '名前がアルファベットでは登録できない' do
        @user.name = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name は全角ひらがな、全角カタカナ、漢字でご入力下さい。')
      end
      it '名字カナがアルファベットでは登録できない' do
        @user.surname_kana = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname kana は全角カタカナでご入力下さい。')
      end
      it '名前カナがアルファベットでは登録できない' do
        @user.name_kana = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana は全角カタカナでご入力下さい。')
      end
      it '名字カナがひらがなでは登録できない' do
        @user.surname_kana = 'しみず'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname kana は全角カタカナでご入力下さい。')
      end
      it '名前カナがひらがなでは登録できない' do
        @user.name_kana = 'りょうすけ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana は全角カタカナでご入力下さい。')
      end
      it '名字カナが漢字では登録できない' do
        @user.surname_kana = '清水'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname kana は全角カタカナでご入力下さい。')
      end
      it '名前カナが漢字では登録できない' do
        @user.name_kana = '涼介'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana は全角カタカナでご入力下さい。')
      end
      it '誕生日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
