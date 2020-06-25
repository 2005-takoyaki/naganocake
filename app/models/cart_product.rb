class CartProduct < ApplicationRecord
  belongs_to :customer
  belongs_to :product, optional: true

  validates :quantity, presence: true
end
