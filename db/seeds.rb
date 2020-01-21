require 'faker'

10.times do
    Coffee.create(
        flavor: Faker::Coffee.blend_name,
        price: Faker::Number.between(from: 1, to: 10),
        toppings: Faker::Dessert.flavor
    )
end

# coffee1 = Coffee.create ("Java", 2, "whipped cream")

5.times do 
    Customer.create(
        name: Faker::Movies::HarryPotter.character,
        username: Faker::TvShows::DumbAndDumber.character
    )
end