class CreateOrderItem < ActiveRecord::Migration
  def up
  	 create_table :orderItems do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
 	 end

  end

  def down
  	drop_table :orderItems
  end
end
