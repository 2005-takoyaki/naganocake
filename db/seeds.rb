# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 顧客データを自動生成

OrderProduct.create!(
  order_id: 1,
  product_id: 1,
  number: 2,
  taxed_price: 1100,
  production_status: "製作待ち"
)

OrderProduct.create!(
  order_id: 1,
  product_id: 3,
  number: 3,
  taxed_price: 990,
  production_status: "製作待ち"
)








