class Customer < ApplicationRecord
  with_options presence: true do
    validates :family_name, :first_name, :family_name_kana, :first_name_kana,
              :birthday, :age, :postal_code, :address, :phone_number
  end
end
