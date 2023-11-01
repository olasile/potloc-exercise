# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times.each do
  store = Store.create!(name: Faker::Company.name)
  arr = Array(5..100)

  10.times.each do
    available = arr.sample
    Product.create!(name: Faker::Commerce.product_name, store: store, available: available)
  end
end

Admin.create!(email: 'admin@test.com', password: 'potlocadmin$5#@', first_name: 'Test', last_name: 'Admin')
