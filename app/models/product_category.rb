class ProductCategory < ActiveRecord::Base
  #Associations
  has_many(:product)
  
  validates_presence_of :name
end
