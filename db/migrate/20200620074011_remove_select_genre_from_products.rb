class RemoveSelectGenreFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :select_genre, :string
  end
end
