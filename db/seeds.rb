Order.destroy_all
Coffee.destroy_all

toppings_array = ["Vanilla", "Coconut", "Pistachio", "Strawberry", "Peanut Butter", "none"]
size_array = ["Small", "Medium", "Large"]
coffee_array = ["Cinnamon", "Light", "Medium", "Dark", "French", "Italian"]
price_array = [4.0, 5.0, 9.0, 3.0, 3.0, 9.0]

99.times do 
coffee1 = Coffee.create(flavor: coffee_array.sample, price: price_array.sample, toppings: toppings_array.sample, size: size_array.sort_by{rand})
end