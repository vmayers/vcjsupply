class User < ActiveRecord::Base
  attr_accessible :name, :login_name, :password, :password_confirmation, :administrator
  attr_accessor :password
  
  before_save :encrypt_password
  
  validates :login_name, :presence => true, :uniqueness => true
  validates_confirmation_of :password, :on => :create
  validates_presence_of :password, :on => :create, :message => "Can't be blank"
  
  def self.authenticate(login_name, password)
    user = find_by_login_name(login_name)
    
    if user && user.hashed_password == BCrypt::Engine.hash_secret(password, user.salt) 
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.hashed_password = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end
end
