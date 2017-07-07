class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :user
      t.string :category
      t.string :product_name
      t.integer :price


      t.timestamps
    end
  end
end
