class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.string :completed_payment

      t.timestamps
    end
  end
end
