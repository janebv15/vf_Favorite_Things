class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.text :name
      t.integer :favorite_things_count

      t.timestamps
    end
  end
end
