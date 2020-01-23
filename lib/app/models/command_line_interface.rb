class CommandLineInterface
    attr_accessor :customer, :order, :coffee, :prompt

    def initialize()
      @prompt = TTY::Prompt.new
    end

    def welcome
      puts "Welcome to Hot Off the Iron Coffee Shop!"
    end

    def ask_name 
      prompt.ask('What is your name?', required: true)
      customer_name
    end 

    def customer_name
      prompt = TTY::Prompt.new
      Customer.create(name: prompt)
    end

    def first_menu
      prompt.select('What whould you like to do?') do |menu|
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
        order_coffee
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
    
    def order_coffee
      pp Coffee.all.pluck(:flavor, :price)
        puts "Enter the flavor of coffee"
        coffee_flavor = gets.chomp
        pp Coffee.all.pluck(:toppings)
        puts "Enter the toppings"
        coffee_toppings = gets.chomp
        puts "Select Your Cup Size from S, M, or L"
        coffee_size = gets.chomp

        price = Coffee.all.pluck(:flavor, :price) == coffee_flavor
        new_coffee = Coffee.new(flavor: coffee_flavor, toppings: coffee_toppings, price: price, size: coffee_size)
        puts ' '
        puts "Your Order has been Created!"
        puts ' '
        order = Order.create(customer_id: customer_name.id, coffee_id: new_coffee.id)
          
           start_menu
    end

    def view_orders 
      Order.all
      start_menu
    end 

    def see_menu
      pp Coffee.all.pluck(:flavor, :price)
      puts ""
      puts "scroll for toppings"
      puts ""
      pp Coffee.all.pluck(:toppings)

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
       welcome
       ask_name
      #  first_menu
       start_menu
    end
end