FactoryBot.define do
  factory :user do
    name { 'テスト太郎' }
    email { 'testtaro@gmail.com' }
    password { 'test222' }
    password_confirmation { 'test222' }
  end
end
