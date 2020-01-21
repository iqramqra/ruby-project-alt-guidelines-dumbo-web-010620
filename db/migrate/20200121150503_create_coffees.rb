class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
      create_table :coffees do |t|
        t.string :flavor
        t.float :price 
        t.string :toppings 
        t.string :size

        t.timestamps 
      end 
  end
end
