require 'faker'
Order.destroy_all

cinnamon = Coffee.create(flavor: 'Cinnamon', price: Faker::Number.between(from: 1, to: 10), toppings: Faker::Dessert.flavor)
light = Coffee.create(flavor: 'Light', price: Faker::Number.between(from: 1, to: 10), toppings: Faker::Dessert.flavor)
medium = Coffee.create(flavor: 'Medium', price: Faker::Number.between(from: 1, to: 10), toppings: Faker::Dessert.flavor)
dark = Coffee.create(flavor: 'Dark', price: Faker::Number.between(from: 1, to: 10), toppings: Faker::Dessert.flavor)
french = Coffee.create(flavor: 'French', price: Faker::Number.between(from: 1, to: 10), toppings: Faker::Dessert.flavor)
italian = Coffee.create(flavor: 'Italian', price: Faker::Number.between(from: 1, to: 10), toppings: Faker::Dessert.flavor)
 
5.times do 
    customer = Customer.create(
        name: Faker::Movies::HarryPotter.character
    )
    Order.create(
        customer_id: customer.id,
        coffee_id: Coffee.all.sample.id
    )
end