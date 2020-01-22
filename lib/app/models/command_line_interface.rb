class CommandLineInterface
    attr_accessor :customer, :order, :coffee

    def customer_name
      prompt = TTY::Prompt.new
      prompt.ask('What is your name?', required: true)
      # name = gets.chomp
    end

    # def select_prompt(string, array_of_choices)
    #   prompt = TTY::Prompt.new
    #   prompt.select(string, array_of_choices)
    # end

    def start_menu
      prompt = TTY::Prompt.new
      prompt.select('What whould you like to do?') do |menu|
        menu.default

        menu.choice 'Order Coffee', 1
        menu.choice 'See Menu', 2
        menu.choice 'Exit', 3
      end
    end

    def start_menu
      choice = select_prompt("",start_menu)
      case choice

    end
    

    def first_menu
      choice = select_prompt("", opening_menu_options)
      #choice = choice.parameterize.underscore converts choice to snake_case
      case choice
      when "New Game"
        character_creation
      when "Load Game"
        character_menu
      when "Delete File"
        character_deletion
      when "Exit"
        exit_message
      end
    end

    def coffee_shop
      system("clear")
      customer_name
      start_menu
    end
end