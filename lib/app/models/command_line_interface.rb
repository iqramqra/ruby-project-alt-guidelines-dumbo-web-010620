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
      prompt.select('Choose Your Flavor') do |menu|
        menu.default

        menu.choice 'Cinnamon', 1
        menu.choice 'Light', 2
        menu.choice 'Medium', 3
        menu.choice 'Dark', 4
        menu.choice 'French', 5
        menu.choice 'Italian', 6 
      end
      toppings_menu
      cup_size
      make_order
      # create_order
    end 

    def toppings_menu 
      prompt.select('Choose Your Toppings') do |menu|
        menu.default

        menu.choice 'Vanilla', 1
        menu.choice 'Coconut', 2
        menu.choice 'Pistachio', 3
        menu.choice 'Strawberry', 4
        menu.choice 'Peanut Butter', 5
        menu.choice 'Blondie', 6 
      end 
    end 

    def cup_size 
      prompt.select('Select Your Size') do |menu|
        menu.default

        menu.choice 'Small', 1
        menu.choice 'Medium', 2
        menu.choice 'Large', 3
      end 
    end 

    def make_order
      case choice = order_menu
      when 1
        new1 = Coffee.new(flavor: "Cinnamon", price: 4.0, toppings: make_order_toppings, size: make_order_size)
      when 2
        new2 = Coffee.new(flavor: "Light", price: 5.0, toppings: make_order_toppings, size: make_order_size)
      when 3 
        new3 = Coffee.new(flavor: "Medium", price: 9.0, toppings: make_order_toppings, size: make_order_size)
      when 4
        new4 = Coffee.new(flavor: "Dark", price: 3.0, toppings: make_order_toppings, size: make_order_size)
      when 5
        new5 = Coffee.new(flavor: "French", price: 3.0, toppings: make_order_toppings, size: make_order_size)
      when 6
        new6 = Coffee.new(flavor: "Italian", price: 9.0, toppings: make_order_toppings, size: make_order_size)

        create_order
        start_menu
      end 
      # create_order
      # start_menu
    end 

    def make_order_toppings 
      case choice = toppings_menu 
      when 1
        top1 = Coffee.new(toppings: "Vanilla")
      when 2 
        top2 = Coffee.new(toppings: "Coconut")
      when 3 
        top3 = Coffee.new(toppings: "Pistachio")
      when 4 
        top4 = Coffee.new(toppings: "Strawberry")
      when 5 
        top5 = Coffee.new(toppings: "Peanut Butter")
      when 6 
        top6 = Coffee.new(toppings: "Blondie")
      end 
    end 

    def make_order_size 
      case choice = cup_size
      when 1
        size1 = Coffee.new(size: "Small")
      when 2 
        size2 = Coffee.new(size: "Medium")
      when 3 
        size3 = Coffee.new(size: "Large")
      end 
    end 

    def create_order 
      puts "Your Order has been Created!"
        Order.create(customer_id: customer_name.id, coffee_id: make_order.id)
    end 
    # def order_coffee
    #   pp Coffee.all.pluck(:flavor, :price)
    #     puts "Enter the flavor of coffee"
    #     coffee_flavor = gets.chomp
    #     pp Coffee.all.pluck(:toppings)
    #     puts "Enter the toppings"
    #     coffee_toppings = gets.chomp
    #     puts "Select Your Cup Size from S, M, or L"
    #     coffee_size = gets.chomp

    #     price = Coffee.all.pluck(:flavor, :price) == coffee_flavor
    #     new_coffee = Coffee.new(flavor: coffee_flavor, toppings: coffee_toppings, price: price, size: coffee_size)
    #     puts ' '
    #     puts "Your Order has been Created!"
    #     puts ' '
    #     order = Order.create(customer_id: customer_name.id, coffee_id: new_coffee.id)
          
    #        start_menu
    # end

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