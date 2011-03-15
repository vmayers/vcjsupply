class ProductCategory < ActiveRecord::Base
  #Associations
  has_many(:product)
end
