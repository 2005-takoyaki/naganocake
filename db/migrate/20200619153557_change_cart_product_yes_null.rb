class ChangeCartProductYesNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :cart_products, :product_id, true
    change_column_null :cart_products, :quantity, true
  end
end
