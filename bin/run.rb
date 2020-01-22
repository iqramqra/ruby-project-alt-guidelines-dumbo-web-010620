require_relative '../config/environment'
require 'pry'
# puts "hello world"

def run
    name = get_name
    puts "Hello #{name}, what would you like to do?"
    main_menu
  end
  
  def get_name
    puts "Welcome to your local coffee shop!"
    puts "Enter your name to get started:"
    gets.chomp
  end
  

  def main_menu
    puts "Show Menu (l), Customize Your Order (c), Delete Your Order (d)"
    answer = gets.chomp.downcase
  
    if answer == "l"
        pp Coffee.all.pluck(:flavor, :price)
        main_menu
      # get all games, iterate through, and print to screen
    elsif answer == "c"
        pp Coffee.all.pluck(:flavor, :price)
        puts "Enter the flavor of coffee"
        coffee_flavor = gets.chomp
        pp Coffee.all.pluck(:toppings)
        puts "Enter the toppings"
        coffee_toppings = gets.chomp
        puts "Select Your Cup Size from S, M, or L"
        coffee_size = gets.chomp

        price = Coffee.all.pluck(:flavor, :price) == coffee_flavor
        Coffee.create(flavor: coffee_flavor, toppings: coffee_toppings, price: price, size: coffee_size)
      # prompt the user to create a new game, and save it to the database
    # elsif answer == "d" 


    else 
      puts "🤷‍♀️"
      main_menu
    end
  end
  
  run
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