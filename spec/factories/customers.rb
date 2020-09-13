FactoryBot.define do
  factory :customer do
    family_name       { '鈴木' }
    first_name        { '一郎' }
    family_name_kana  { 'スズキ' }
    first_name_kana   { 'イチロウ' }
    birthday          { '1973-10-22' }
    gender            { '男' }
    age               { 46 }
    postal_code       { '123-4567' }
    address           { '愛知県西春日井郡豊山町1-1' }
    building_name     { 'イチロービル1001' }
    phone_number      { '09012345678' }
    email             { 'ichiro@gmail.com' }
  end
end
