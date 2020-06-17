# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 顧客データを自動生成
20.times do |n|
  gimei = Gimei.new

  Customer.create(
    last_name: gimei.last.kanji,
    first_name: gimei.first.kanji,
    kana_last_name: gimei.last.katakana,
    kana_first_name: gimei.first.katakana,
    email: Faker::Internet.email,
    postal_code: Faker::Address.postcode,  #string
    address: gimei.address.kanji,
    phone_number: Faker::Number.leading_zero_number(digits: 10),
    is_valid: Faker::Boolean.boolean,       #boolean
    password: Faker::Number.number(digits: 6)
  )
end