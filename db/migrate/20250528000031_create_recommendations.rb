class CreateRecommendations < ActiveRecord::Migration[7.1]
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
