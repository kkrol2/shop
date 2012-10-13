class Category < ActiveRecord::Base
  attr_accessible :name, :id
  has_many :products 
end
