class Product < ApplicationRecord
	belongs_to :genre
	attachment :image
  has_many :orders, through: :order_products
  has_many :order_products
end
