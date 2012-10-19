# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category = Category.create :name => 'Monitory'
product = Product.create :name => 'Samsung NX035', :price => 1000, :description => '22 cala, LCD'
category.products << product
category = Category.create :name => 'PC'
product = Product.create :name => 'iMac',  :price => 7000, :description => 'SSD 512 GB, procesor i5, 4GB ram, 27 cala'
category.products << product
product = Product.create :name => 'iMac Mini', :price => 3000, :description => 'HDD 256 GB, procesor i3, 4GB ram'
category.products << product
category = Category.create :name => 'Laptopy'
product = Product.create :name => 'DELL XPS', :price => 3500, :description => 'HDD 1024 GB, procesor i7, 8GB ram'
category.products << product
category = Category.create :name => 'Ultrabooki'
product = Product.create :name => 'Mac Book Pro', :price => 6000, :description => 'SSD 256 GB, procesor i5, 4GB ram'
category.products << product
product = Product.create :name => 'Zenbook v.1', :price => 3000, :description => 'SSD 128 GB, procesor i5, 4GB ram'
category.products << product
product = Product.create :name => 'Zenbook v.2', :price => 3500, :description => 'SSD 128 GB, procesor i7, 6GB ram'
category.products << product
product = Product.create :name => 'Lenovo ThinkPad', :category_id => 3, :price => 2000, :description => 'HDD 128 GB, procesor i3, 4GB ram'
category.products << product









