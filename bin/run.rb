require_relative '../config/environment'
require 'pry'
ActiveRecord::Base.logger.level = 1
# puts "hello world"

# def run
#     welcome 
#      puts "Hello #{new_customer}, what would you like to do?"
#     main_menu  
#   end

# def new_customer 
#     name = get_name
#     Customer.create(name: name)
# end 
#     def welcome 
#         puts "Hi!"
#         puts "Please enter your name:"
#     end 

#   def get_name
#    gets.chomp
#   end
  
#   def return_to_main_menu
#     puts "Return to Main Menu (r)"
#         ans = gets.chomp.downcase 
#     if ans == "r"
#         main_menu 
#     end 
#   end 

#   def main_menu
#     puts "Show Menu (l), Customize Your Order (c), View your Order (v), Delete Your Order (d),  Exit (e)"
#     answer = gets.chomp.downcase

#     if answer == "l"
#         pp Coffee.all.pluck(:flavor, :price)
#         return_to_main_menu
#       # get all games, iterate through, and print to screen
#     elsif answer == "c"
#         pp Coffee.all.pluck(:flavor, :price)
#         puts "Enter the flavor of coffee"
#         coffee_flavor = gets.chomp
#         pp Coffee.all.pluck(:toppings)
#         puts "Enter the toppings"
#         coffee_toppings = gets.chomp
#         puts "Select Your Cup Size from S, M, or L"
#         coffee_size = gets.chomp

#         price = Coffee.all.pluck(:flavor, :price) == coffee_flavor
#         new_coffee = Coffee.new(flavor: coffee_flavor, toppings: coffee_toppings, price: price, size: coffee_size)

#         puts "Rate your Service from 1 to 5"
#             rating = gets.chomp 

#         puts "Your Order has been Created!"  
#         order = Order.create(rating: rating, customer_id: new_customer.id, coffee_id: new_coffee.id)
#         return_to_main_menu
#     elsif answer == "v"
#       orders = Order.all.select {|orders| orders.customer}
#      return_to_main_menu

#     # elsif answer == "d" 
#     elsif answer == "e"
#         exit 


#     else 
#      puts "Invalid Entry, Please try again"
#       main_menu
#     end

#     def exit 
#         Exit
#     end 
#   end
  
  # run
# 
# elsif answer == "c"
    # prompt the user to create a new game, and save it to the database
    # puts "Enter name of game"
    # game_name = gets.chomp.downcase
    # puts "Enter genre of game"
    # game_genre = gets.chomp.downcase
    # puts "Enter price of game"
    # game_price = gets.chomp.downcase
    # Game.create(title: game_name, genre: game_genre, price: game_price)



# def greet
#     puts 'Hello, what is your name?'
    
# end

# def user_input
#     name = gets.chomp
#     puts `Welcome #{name}`
# end

# greet
# user_input
# # welcome(name)



# CLI = New code
new_cli = CommandLineInterface.new
new_cli.coffee_shop