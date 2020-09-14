require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do
    @customer = FactoryBot.build(:customer)
  end

  describe '顧客新規登録' do
    context '新規登録が上手くいく時' do
      it '全ての項目が入力されていたら登録できる' do
        expect(@customer).to be_valid
      end

      it 'building_nameは空でも登録できる' do
        @customer.building_name = nil
        expect(@customer).to be_valid
      end

      it 'emailは空でも登録できる' do
        @customer.email = nil
        expect(@customer).to be_valid
      end
    end

    context '新規登録が上手くいかない時' do
      it 'family_nameが空だと登録できない' do
        @customer.family_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Family name can't be blank")
      end

      it 'first_nameが空だと登録できない' do
        @customer.first_name = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("First name can't be blank")
      end

      it 'family_name_kanaが空だと登録できない' do
        @customer.family_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Family name kana can't be blank")
      end

      it 'family_name_kanaが空だと登録できない' do
        @customer.first_name_kana = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'birthdayが空だと登録できない' do
        @customer.birthday = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'genderが空だと登録できない' do
        @customer.gender = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Gender can't be blank")
      end

      it 'ageが空だと登録できない' do
        @customer.age = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Age can't be blank")
      end

      it 'postal_codeが空だと登録できない' do
        @customer.postal_code = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'addressが空だと登録できない' do
        @customer.address = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空だと登録できない' do
        @customer.phone_number = ''
        @customer.valid?
        expect(@customer.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'family_nameが漢字・ひらがな・カタカナ以外だと登録できない' do
        @customer.family_name = 'myouji'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Family name is invalid')
      end

      it 'first_nameが漢字・ひらがな・カタカナ以外だと登録できない' do
        @customer.first_name = 'namae'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('First name is invalid')
      end

      it 'family_name_kanaがカタカナ以外だと登録できない' do
        @customer.family_name_kana = '名字'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Family name kana is invalid')
      end

      it 'first_name_kanaがカタカナ以外だと登録できない' do
        @customer.first_name_kana = '名前'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('First name kana is invalid')
      end

      it 'ageが130以上だと登録できない' do
        @customer.age = 150
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Age is not included in the list')
      end

      it 'ageが0以下だと登録できない' do
        @customer.age = -1
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Age is not included in the list')
      end

      it 'postal_codeにハイフンがないと登録できない' do
        @customer.postal_code = '1111111'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Postal code is invalid')
      end

      it 'phone_numberにハイフンがあると登録できない' do
        @customer.phone_number = '090-1234-5678'
        @customer.valid?
        expect(@customer.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
