require 'colorize'
require 'lolcat'

class CommandLineInterface
    attr_accessor :customer, :order, :coffee, :prompt

    def initialize()
      @prompt = TTY::Prompt.new
    end

    # def title
    #   fork{exec 'lolcat -a -d 4 lib/titlesequence.plaintext'}
    # end
    # fork{exec 'lolcat -a -d 4 lib/titlesequence.plaintext'}
    

    def welcome
      puts "Welcome to Hot Off the Iron Coffee Shop!"
      run
    end

  def run
    puts "Please enter your name:"
    puts "Hello #{new_customer.name}!"
  end

def new_customer 
    name = get_name
    Customer.create(name: name)
end 

  def get_name
   gets.chomp
  end
  
    def first_menu
      prompt.select('What would you like to do?') do |menu|
        menu.default

        menu.choice 'Order Coffee', 1
        menu.choice 'See Menu', 2
        menu.choice 'View Your Order', 3
        menu.choice 'Delete Your Order', 4
        menu.choice 'Exit', 5
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
        exit_message
      end
    end
    
    def order_menu 
      flavor_number = prompt.select('Choose Your Flavor') do |menu|
      menu.default
      menu.choice 'Cinnamon', 1
      menu.choice 'Light', 2
      menu.choice 'Medium', 3
      menu.choice 'Dark', 4
      menu.choice 'French', 5
      menu.choice 'Italian', 6 
    end
    # binding.pry
    make_order(flavor_number)
    create_order 
  end 

  def toppings_menu(coffee) 
    topps = prompt.select('Choose Your Toppings') do |menu|
    menu.default
    menu.choice 'Vanilla', Coffee.update(toppings: 'Vanilla')
    menu.choice 'Coconut', Coffee.update(toppings: 'Coconut')
    menu.choice 'Pistachio', Coffee.update(toppings: 'Pistachio')
    menu.choice 'Strawberry', Coffee.update(toppings: 'Strawberry')
    menu.choice 'Peanut Butter', Coffee.update(toppings: 'Peanut Butter')
    menu.choice 'none', Coffee.update(toppings: 'none')
  end 
end  

def cup_size(coffee)
  size = prompt.select('Select Your Size') do |menu|
  menu.default
  menu.choice 'Small', Coffee.update(size: 'Small')
  menu.choice 'Medium', Coffee.update(size: 'Medium')
  menu.choice 'Large', Coffee.update(size: 'Large')
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
      puts "Your Order has been Created!"
        new_order = Order.create(customer_id: new_customer.id, coffee_id: new_coffee.id)
        start_menu
    end 

    def view_orders
      Order.all.find_by(new_customer.name)
      start_menu
    end 

    def see_menu
      puts ""
      puts "Flavors:"
      puts ""
      pp Coffee.all.pluck(:flavor, :price)
      puts ""
      puts "Toppings:"
      puts ""
      pp Coffee.all.pluck(:toppings)
      puts ""
      start_menu
    end

    def exit_message
      puts "Enjoy!"
      sleep 1.0
      system("clear")
    end

    def delete_order
      Order.destroy_all
      start_menu
    end 

    def coffee_shop
      system("clear")
      # title 
      # sleep 6.5
      welcome
      sleep 1.0
      start_menu
    end
end




  # def new_coffee 
    #   new_coff = Coffee.create(flavor: order_menu, price: order_menu, toppings: toppings_menu, size: cup_size)
    # end 
      # 
      #   start_menu(customer)
    # end 
  