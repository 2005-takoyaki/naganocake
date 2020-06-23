class AddSelectGenreToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :select_genre, :string
  end
end
