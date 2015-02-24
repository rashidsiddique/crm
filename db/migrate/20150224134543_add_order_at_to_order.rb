class AddOrderAtToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_at, :datetime
  end
end
