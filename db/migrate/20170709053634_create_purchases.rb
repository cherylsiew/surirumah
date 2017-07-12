class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.references :user
      t.references :product
      t.integer :quantity
      t.integer :total_price
      t.string :transaction_id
      t.string :transaction_status
      t.string :fourdigits

      t.timestamps
    end
  end
end
