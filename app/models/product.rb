class Product < ApplicationRecord
	validates :image, :name, :introduction, :non_taxed_price, presence: true
	validates :has_sold, inclusion: { in: [true, false] }
	validates :name, uniqueness: true
	validates :non_taxed_price, numericality: { only_integer: true }
	belongs_to :genre
	attachment :image
end
