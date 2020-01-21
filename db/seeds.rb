require 'faker'

10.times do
    Coffee.create(
        flavor: Faker::Coffee.blend_name,
        price: Faker::Number.number(2),
        toppings: Faker::Dessert.flavor
    )
end

# coffee1 = Coffee.create ("Java", 2, "whipped cream") 

# Faker::Coffee.blend_name #=> "Summer Solstice"

# Faker::Coffee.origin #=> "Antigua, Guatemala"

# Faker::Coffee.variety #=> "Pacas"

# Faker::Coffee.notes #=> "balanced, silky, marzipan, orange-creamsicle, bergamot"

# Faker::Coffee.intensifier #=> "quick"