# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = {}
uids = []
User.all.each { |u| uids << u.id }


ActiveRecord::Base.transaction do
  5.times do 
    product['category'] = ["Lighting", "Furniture", "Decorative"].sample
    product['product_name'] = Faker::App.name
    product['price'] = rand(50..6000)
    product['quantity'] = rand(1..20)
    product['size'] = Faker::App.name
    product['user_id'] = uids.sample
    Product.create(product)
  end
end