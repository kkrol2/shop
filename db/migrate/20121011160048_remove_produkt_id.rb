class RemoveProduktId < ActiveRecord::Migration
  def up
  	remove_column :products, :product_id
  	add_column :products, :category_id, :integer
  end

  def down
  end
end
