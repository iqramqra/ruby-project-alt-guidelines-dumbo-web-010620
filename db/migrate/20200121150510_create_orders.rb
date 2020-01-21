class CreateOrders < ActiveRecord::Migration[5.2]
  def change
      create_table :orders do |t|
        t.integer :rating
        t.integer :customer_id
        t.integer :coffee_id
        t.timestamps 
      end 
  end
end
