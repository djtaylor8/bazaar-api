class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :type
      t.integer :price
      t.integer :total_available
      t.string :image
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
