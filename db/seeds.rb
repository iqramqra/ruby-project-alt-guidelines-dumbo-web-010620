require 'faker'
Order.destroy_all

10.times do
    Coffee.create(
        flavor: Faker::Coffee.blend_name,
        price: Faker::Number.between(from: 1, to: 10),
        toppings: Faker::Dessert.flavor
    )
end

# coffee1 = Coffee.create ("Java", 2, "whipped cream")

5.times do 
    customer = Customer.create(
        name: Faker::Movies::HarryPotter.character
    )
    Order.create(
        rating: Faker::Number.between(from: 1, to: 5),
        customer_id: customer.id,
        coffee_id: Coffee.all.sample.id
    )
end

# 5.times do 
    
# end