class Ship < ApplicationRecord
  belongs_to :customer

  def view_all_customer_date
    self.postal_code + '    ' + self.address + '    ' + self.name
  end
end
