class AddCustomerIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :customer_id, :integer, index: true
  end
end
