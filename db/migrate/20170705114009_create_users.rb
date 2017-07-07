class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :email
      t.string  :address1
      t.string  :address2
      t.string  :postcode
      t.string  :country
      t.string  :telephone

      t.timestamps
    end
  end
end
