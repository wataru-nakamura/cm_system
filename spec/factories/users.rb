FactoryBot.define do
  factory :user do
    name { 'テスト太郎' }
    email { 'test@gmail.com' }
    password { 'test11' }
    password_confirmation { 'test11' }
  end
end
