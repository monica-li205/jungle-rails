class Product < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :quantity
  validates_presence_of :category
end