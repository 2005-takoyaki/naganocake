class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  belongs_to :customer
  has_many :ships, through: :customer

  enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済: 4 },_suffix: true
  enum payment_method: { クレジットカード: 0, 銀行振り込み: 1 },_suffix: true
end
