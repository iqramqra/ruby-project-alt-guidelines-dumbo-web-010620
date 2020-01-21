require_relative '../config/environment'

# puts "hello world"

def run
    name = get_name
    puts "Hello #{name}, what would you like to do next?"
    main_menu
  end
  
  def get_name
    puts "Hi!"
    puts "Please enter your name:"
    gets.chomp
  end
  
  def main_menu
    puts "Show Menu (l), Customize order (c)"
    answer = gets.chomp.downcase
  
    if answer == "l"
        pp Coffee.all.pluck(:flavor)
        main_menu
      # get all games, iterate through, and print to screen
    elsif answer == "c"
        pp Coffee.all.pluck(:flavor)
        puts "Enter the flavor of coffee"
        coffee_flavor = gets.chomp
        pp Coffee.all.pluck(:toppings)
        puts "Enter the toppings"
        coffee_toppings = gets.chomp
        Coffee.create(flavor: coffee_flavor, toppings: coffee_toppings, price: 5)
      # prompt the user to create a new game, and save it to the database
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