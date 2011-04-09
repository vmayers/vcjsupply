class AddAdminUser < ActiveRecord::Migration
  def self.up
    User.create(:name => "Administrator", :login_name => "admin", :password => "Adm1n246!", :password_confirmation => "Adm1n246!", :administrator => true) 
  end

  def self.down
    User.find_by_name("Administrator").destroy
  end
end
