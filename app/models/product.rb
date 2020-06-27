class Product < ApplicationRecord
	validates :name, :introduction, presence: { message: ':必ず1文字以上入力してください。' }
	validates :image, presence: { message: ':必ず画像を選択してください。' }
	validates :genre_id, presence: { message: ':必ず選択してください。' }
	validates :has_sold, inclusion: { in: [true, false], message: ':必ず選択してください。' }
	validates :name, uniqueness: true
	validates :non_taxed_price,numericality: { only_integer: true, message: ':必ず半角の整数で入力してください。' }

	belongs_to :genre
	attachment :image
	has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :cart_products, dependent: :destroy

end
