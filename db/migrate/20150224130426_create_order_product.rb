class CreateOrderProduct < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.integer :quantity
      t.references :product, index: true
      t.references :order, index: true
    end
    add_foreign_key :order_products, :products
    add_foreign_key :order_products, :orders
  end
end
