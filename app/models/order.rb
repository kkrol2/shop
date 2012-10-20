class Order < ActiveRecord::Base
    attr_accessible :buyer_id,:confirmed,:id
	belongs_to :buyer
	has_many :orderItems
	
end