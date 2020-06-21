class Product < ApplicationRecord
	belongs_to :genre
	attachment :image
  has_many :cart_products, dependent: :destroy
end
