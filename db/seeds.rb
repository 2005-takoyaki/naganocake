# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 顧客データを自動生成



OrderProduct.create!(
  order_id: 4,
  product_id: 4,
  number: 2,
  taxed_price: 330,
  production_status: 1
)

OrderProduct.create!(
  order_id: 4,
  product_id: 5,
  number: 3,
  taxed_price: 440,
  production_status: 1
)


<<<<<<< HEAD
=======






# 顧客を自動生成
20.times do |n|
  gimei = Gimei.new

  Customer.create(
    last_name: gimei.last.kanji,
    first_name: gimei.first.kanji,
    kana_last_name: gimei.last.katakana,
    kana_first_name: gimei.first.katakana,
    email: Faker::Internet.email,
    postal_code: Faker::Number.number(digits: 7),  #string
    address: gimei.address.kanji,
    phone_number: Faker::Number.leading_zero_number(digits: 10),
    is_valid: Faker::Boolean.boolean,       #boolean
    password: Faker::Number.number(digits: 6),
  )
end

#管理者作成
Admin.create!(
   email: 't@t',
   password: 'zaq',
)
>>>>>>> 5a0f610b7a3fbe2be6f11f17480199cf73e8c0e4
