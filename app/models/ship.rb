class Ship < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :postal_code, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true

  def view_all_customer_date
    self.postal_code + '    ' + self.address + '    ' + self.name
  end
end
