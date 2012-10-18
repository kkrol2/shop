class Buyer < ActiveRecord::Base


  attr_accessible :firstname, :lastname,:address
  has_many :orders
end
