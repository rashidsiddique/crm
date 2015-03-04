class CreateProductCategory < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.references :product, index: true
      t.references :category, index: true
    end
    add_foreign_key :product_categories, :products
    add_foreign_key :product_categories, :categories
  end
end
