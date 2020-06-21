class Product < ApplicationRecord
	belongs_to :genre
	attachment :image
	has_many :order_products, dependent: :destroy
end
