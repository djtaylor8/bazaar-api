class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :address
      t.string :city
      t.string :state
      t.integer :total
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
