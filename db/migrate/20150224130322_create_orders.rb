class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :deal

      t.timestamps null: false
    end
  end
end
