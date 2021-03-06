class Product < ActiveRecord::Base
  #Associations
  belongs_to(:product_category)
  belongs_to(:manufacturer)
  
  #Paperclip
  has_attached_file :photo,
    :styles => {
      :thumb => "50x50",
      :small => "150x150"
    }, 
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/:style/:id/:filename"
    
  validates_presence_of :number
  
  def self.search(search)
    if search
      # Check out Shinx to set up a full search engine 
      where('number LIKE ?', "%#{search}%")
    else
      #Like calling All but doesn't perform the actual query
      scoped
    end
  end
end
