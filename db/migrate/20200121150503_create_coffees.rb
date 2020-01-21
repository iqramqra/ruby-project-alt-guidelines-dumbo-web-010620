class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
      create_table :coffees do |t|
        t.string :flavor
        t.integer :price 
        t.string :toppings 

        t.timestamps 
      end 
  end
end
