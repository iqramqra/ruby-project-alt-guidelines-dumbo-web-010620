require 'colorize'
require 'lolcat'

class CommandLineInterface
    attr_accessor :customer, :order, :coffee, :prompt

    def initialize()
      @prompt = TTY::Prompt.new
      @@coff = @new
    end

    def title
      fork{exec 'lolcat -a -d 4 lib/titlesequence.plaintext'}
    end
   
    def welcome
      puts "Welcome to Hot Off the Iron Coffee Shop!".green
      run
    end

  def run
    puts "Please enter your name:".green
    puts "Hello #{new_customer.name}!".light_yellow
  end

def new_customer 
    name = get_name
    Customer.create(name: name)
end 

  def get_name
   gets.chomp
  end

  def change_name
    puts "Enter your new name."
    my_name = gets.chomp 
    new_new_name = new_customer.update(name: my_name)
    puts "Your name has been changed to #{my_name}".light_yellow
    puts ""
    start_menu
  end
  
    def first_menu
      prompt.select('What would you like to do?') do |menu|
        menu.default

        menu.choice 'Order Coffee'.light_yellow, 1
        menu.choice 'See Menu'.light_yellow, 2
        menu.choice 'View Your Order'.light_yellow, 3
        menu.choice 'Delete Your Order'.light_yellow, 4
        menu.choice 'Change Your Name'.light_yellow, 5
        menu.choice 'Exit'.red, 6
      end
    end

    def start_menu
      case choice = first_menu
      when 1
        order_menu
      when 2
        see_menu
      when 3 
        view_orders
      when 4
        delete_order
      when 5
        change_name
      when 6
        exit_message
      end
    end
    
    def order_menu 
      flavor_number = prompt.select('Choose Your Favorite Type of Coffee') do |menu|
      menu.default
      menu.choice 'Cinnamon'.light_yellow, 1
      menu.choice 'Light'.light_yellow, 2
      menu.choice 'Medium'.light_yellow, 3
      menu.choice 'Dark'.light_yellow, 4
      menu.choice 'French'.light_yellow, 5
      menu.choice 'Italian'.light_yellow, 6 
    end
    # binding.pry
    make_order(flavor_number)
    create_order
  end 

  def toppings_menu(coffee) 
    topps = prompt.select('Choose Your Favorite Type of Milk') do |menu|
    menu.default
    menu.choice 'Vanilla'.light_yellow, -> {coffee.update(toppings: 'Vanilla')}
    menu.choice 'Coconut'.light_yellow, -> {coffee.update(toppings: 'Coconut')}
    menu.choice 'Pistachio'.light_yellow, -> {coffee.update(toppings: 'Pistachio')}
    menu.choice 'Strawberry'.light_yellow, -> {coffee.update(toppings: 'Strawberry')}
    menu.choice 'Peanut Butter'.light_yellow, -> {coffee.update(toppings: 'Peanut Butter')}
    menu.choice 'none'.white, -> {coffee.update(toppings: 'none')}
  end 
end  

def cup_size(coffee)
  size = prompt.select('What Size Would You Like?') do |menu|
  menu.default
  menu.choice 'Small'.light_yellow, -> {coffee.update(size: 'Small')}
  menu.choice 'Medium'.light_yellow, -> {coffee.update(size: 'Medium')}
  menu.choice 'Large'.light_yellow, -> {coffee.update(size: 'Large')}
end 
end 

def make_order(flavor_number)
  # binding.pry
  case flavor_number
  when 1
    @new = Coffee.create(flavor: "Cinnamon", price: 4.0, toppings: nil, size: nil)
  when 2
    @new = Coffee.create(flavor: "Light", price: 5.0, toppings: nil, size: nil)
  when 3 
    @new = Coffee.create(flavor: "Medium", price: 9.0, toppings: nil, size: nil)
  when 4
    @new = Coffee.create(flavor: "Dark", price: 3.0, toppings: nil, size: nil)
  when 5
    @new = Coffee.create(flavor: "French", price: 3.0, toppings: nil, size: nil)
  when 6
    @new = Coffee.create(flavor: "Italian", price: 9.0, toppings: nil, size: nil)
    # binding.pry 
  end 
  toppings_menu(@new)
  cup_size(@new)
end  

  
  

    def make_order_size 
      case choice = cup_size
      when 1
        size1 = Coffee.create(size: "Small")
      when 2 
        size2 = Coffee.create(size: "Medium")
      when 3 
        size3 = Coffee.create(size: "Large")
      end
    end 

    def create_order
      puts ""
      puts "Your Order has been Created!".red 
        Order.create(customer_id: new_customer.id, coffee_id: @new.id)
        # binding.pry 
        start_menu
    end 

    def view_orders
      if Order.all.length >= 1
        #  pp Coffee.last
        coff_order = Order.all.map {|order|order.coffee} 
        coff_order.map do |i|
          puts "flavor: #{i.flavor}"
          puts "toppings: #{i.toppings}"
          puts "size: #{i.size}"
          puts "price: #{i.price}"
          puts "===================="
        end
      else
        puts "Your order list is empty.".red
        # pp Order.all

        # order_array =  Order.all.pluck(:flavor)
        # order_array.each do |e|
        #   puts "#{e}"
        # end
      end
      start_menu
    end 

    def see_menu
      puts ""
      puts "Type of Coffee:"
      puts ""
      # Coffee.all.pluck(:flavor).uniq
      flavor_array =  Coffee.all.pluck(:flavor).uniq
      flavor_array.each do |e|
        puts "#{e}"
      end
      puts ""
      puts "Type of Milk:"
      puts ""
      topping_array = Coffee.all.pluck(:toppings).uniq
      topping_array.each do |t|
        puts "#{t}"
      end
      puts ""
      start_menu
    end

    def exit_message
      puts "Enjoy!".yellow 
      sleep 1.0
      system("clear")
    end

    def delete_order
      if Order.all.length == 0 
       puts ""
       puts "There is No Order to Delete".red 
       start_menu
      else 
      puts ""
      puts "Your Order Has Been Deleted.".red
      puts " "
      Order.first.destroy
      start_menu
      end 
    end 

    def play_bell
      pid = fork{exec 'afplay', "lib/bell_counter.mp3"}
    end


    def coffee_shop
      system("clear")
      Order.destroy_all
      title
      play_bell 
      sleep 6.5
      welcome
      sleep 1.0
      start_menu
    end
end
