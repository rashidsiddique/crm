class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price,  precision: 8, scale: 2
      t.integer :quantity
      t.integer :status
      t.integer :recurring_billing
      t.decimal :trial_price,  precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
