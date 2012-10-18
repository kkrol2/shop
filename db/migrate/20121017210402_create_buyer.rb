class CreateBuyer < ActiveRecord::Migration
 def up
  	 create_table :buyers do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.timestamps
 	 end

  end

  def down
  	drop_table :orders
  end
end