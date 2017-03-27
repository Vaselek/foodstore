# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

shop_fixtures = Rails.root.join('app', 'assets', 'images', 'fixtures', 'shops')
dish_fixtures = Rails.root.join('app', 'assets', 'images', 'fixtures', 'dishes')

User.create!(name: "Asel", email: "asel@mail.ru", password: "jkljkl", admin: true, user: true, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)
User.create!(name: "user1", email: "user1@mail.ru", password: "jkljkl", admin: false, user: true, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)
User.create!(name: "user2", email: "user2@mail.ru", password: "jkljkl", admin: false, user: true, address: Faker::Address.street_address, phone: Faker::PhoneNumber.cell_phone)

1.upto 7 do |i|
	Shop.create(title: Faker::Company.name, 
							description: Faker::Lorem.sentence,
							logo: File.new(shop_fixtures.join(i.to_s)))
end

shops = Shop.all

1.upto 21 do |i|
	Dish.create(title: Faker::Food.ingredient, 
							description: Faker::Lorem.sentence, 
							price: Faker::Number.decimal(2),
							shop: shops.sample,
							image: File.new(dish_fixtures.join(i.to_s)))
end

Shop.create(title: "Namba", 
						description: "Food store",
						logo: File.new(shop_fixtures.join(8.to_s)))


Dish.create(title: "Manty", 
						description: "nice food", 
						price: 80.0,
						shop_id: 8,
						image: File.new(dish_fixtures.join(22.to_s)))

dish = Dish.find(8)


order_item = OrderItem.create(order_id: 1, dish: dish, price: dish.price, portion: 1)
order_items = OrderItem.all
total_price = order_items.sum { |p| p.price * p.portion }
Order.create(user_id: 1, shop_id: 1, total_price: total_price)

dish_cart = DishCart.create(cart_id: 1, dish: dish, price: dish.price, portion: 1)
dish_carts = DishCart.all
Cart.create(user_id: 1, shop_id: 1)