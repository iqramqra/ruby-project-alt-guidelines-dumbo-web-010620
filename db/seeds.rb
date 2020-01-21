require 'faker'

10.times do
    Coffee.create(
        flavor: Faker::Coffee.blend_name,
        price: Faker::Number.number(1..6),
        toppings: Faker::Dessert.flavor
    )
end

# coffee1 = Coffee.create ("Java", 2, "whipped cream")