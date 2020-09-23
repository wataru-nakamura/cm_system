  1.times do |n|
    family_name = Gimei.last.kanji
    first_name = Gimei.first.kanji
    family_name_kana = Gimei.last.katakana
    first_name_kana = Gimei.first.katakana
    birthday = Faker::Date.birthday(min_age: 18, max_age: 100)
    gender = "男"
    age = Faker::Number.number(digits: 2)
    postal_code = Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s
    address = Gimei.address
    address = address.kanji
    # building_name
    phone_number = '090' + Faker::Number.number(digits: 8).to_s
    email = Faker::Internet.free_email

    Customer.create(
      family_name: family_name,
      first_name: first_name,
      family_name_kana: family_name_kana,
      first_name_kana: first_name_kana,
      birthday: birthday,
      gender: gender,
      age: age,
      postal_code: postal_code,
      address: address,
      phone_number: phone_number,
      email: email
    )
end