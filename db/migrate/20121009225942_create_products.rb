class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :product_id
      t.integer :price
      t.timestamps
    end
  end
end
