class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_products, dependent: :destroy

	enum payment_method: {クレジットカード:0, 銀行振り込み:1}
	enum order_status: {着手不可:0, 製作待ち:1, 製作中:2, 製作完了:3}
end
