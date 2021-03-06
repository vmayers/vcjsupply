class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :number
      t.string :description
      t.integer :product_category_id
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
