# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shop_fixtures = Rails.root.join('app', 'assets', 'images', 'fixtures', 'shops')
dish_fixtures = Rails.root.join('app', 'assets', 'images', 'fixtures', 'dishes')

User.create!(name: "Asel", email: "asel@mail.ru", password: "jkljkl", admin: true, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)
User.create!(name: "user1", email: "user1@mail.ru", password: "jkljkl", admin: true, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)
User.create!(name: "user2", email: "user2@mail.ru", password: "jkljkl", admin: true, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)
1.upto 8 do |i|
	Shop.create(title: Faker::Company.name, 
							description: Faker::Lorem.sentence,
							logo: File.new(shop_fixtures.join(i.to_s)))
end

shops = Shop.all

1.upto 24 do |i|
	Dish.create(title: Faker::Food.ingredient, 
							description: Faker::Lorem.sentence, 
							price: Faker::Number.decimal(2),
							shop: shops.sample,
							image: File.new(dish_fixtures.join(i.to_s)))
end

