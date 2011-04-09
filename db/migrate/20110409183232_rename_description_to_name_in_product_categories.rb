class RenameDescriptionToNameInProductCategories < ActiveRecord::Migration
  def self.up
    rename_column :product_categories, :description, :name
  end

  def self.down
    rename_column :product_categories, :name, :description
  end
end
