# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create :id => 2, :name => 'Monitory'
Category.create :id => 1, :name => 'PC'
Category.create :id => 3, :name => 'Laptopy'
Category.create :id => 4, :name => 'Ultrabooki'

Product.create :name => 'Zenbook v.1', :category_id => 4, :price => 3000, :description => 'SSD 128 GB, procesor i5, 4GB ram'
Product.create :name => 'Zenbook v.2', :category_id => 4, :price => 3500, :description => 'SSD 128 GB, procesor i7, 6GB ram'
Product.create :name => 'Samsung NX035', :category_id => 2, :price => 1000, :description => '22 cala, LCD'
Product.create :name => 'DELL XPS', :category_id => 1, :price => 3500, :description => 'HDD 1024 GB, procesor i7, 8GB ram'
Product.create :name => 'Mac Book Pro', :category_id => 4, :price => 6000, :description => 'SSD 256 GB, procesor i5, 4GB ram'
Product.create :name => 'iMac', :category_id => 1, :price => 7000, :description => 'SSD 512 GB, procesor i5, 4GB ram, 27 cala'
Product.create :name => 'iMac Mini', :category_id => 1, :price => 3000, :description => 'HDD 256 GB, procesor i3, 4GB ram'
Product.create :name => 'Lenovo ThinkPad', :category_id => 3, :price => 2000, :description => 'HDD 128 GB, procesor i3, 4GB ram'

