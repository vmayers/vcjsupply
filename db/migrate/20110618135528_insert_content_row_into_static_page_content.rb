class InsertContentRowIntoStaticPageContent < ActiveRecord::Migration
  def self.up
    StaticPageContent.create(:contact_us => '', :about => '')
  end

  def self.down
    @contents = StaticPageContent.all
    
    @contents.each do |c|
      c.destroy
    end 
  end
end
