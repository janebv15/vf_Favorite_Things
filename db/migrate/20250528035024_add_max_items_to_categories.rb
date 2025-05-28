class AddMaxItemsToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :max_items, :integer
  end
end
