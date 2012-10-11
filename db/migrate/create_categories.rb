class CreateCategories < ActiveRecord::Migration
  def create
    change_table :categories do |t|
      t.string :name
      t.timestamps

    end
  end

end
