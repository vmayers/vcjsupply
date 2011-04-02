class Product < ActiveRecord::Base
  #Associations
  belongs_to(:product_category)
  belongs_to(:manufacturer)
  
  #Paperclip
  has_attached_file :photo,
    :styles => {
      :thumb => "100x100",
      :small => "150x150"
    } 
    
  validates_presence_of :number
end
