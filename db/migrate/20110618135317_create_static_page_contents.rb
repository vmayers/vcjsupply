class CreateStaticPageContents < ActiveRecord::Migration
  def self.up
    create_table :static_page_contents do |t|
      t.text :contact_us
      t.text :about

      t.timestamps
    end
  end

  def self.down
    drop_table :static_page_contents
  end
end
