require 'faker'
Order.destroy_all
Coffee.destroy_all

toppings_array = ["Vanilla", "Coconut", "Pistachio", "Strawberry", "Peanut Butter", "None"]
size_array = ["Small", "Medium", "Large"]
coffee_array = ["Cinnamon", "Light", "Medium", "Dark", "French", "Italian"]
price_array = [4.0, 5.0, 9.0, 3.0, 3.0, 9.0]

10.times do 
coffee1 = Coffee.create(flavor: coffee_array.sample, price: price_array.sample, toppings: toppings_array.sample, size: size_array.sample)
end 

# #         coffee_id: Coffee.all.sample.id
# #     )
# # end