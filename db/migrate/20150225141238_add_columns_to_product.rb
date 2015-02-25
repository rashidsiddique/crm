class AddColumnsToProduct < ActiveRecord::Migration
  def change
    add_column :products, :has_trial, :boolean,  default: false
    add_column :products, :trial_days, :integer
    add_column :products, :is_recurring, :boolean,  default: false
    add_column :products, :recurring_type, :integer
    add_column :products, :recurring_no_of_payments, :integer
    add_column :products, :recurring_custom_type, :integer
    add_column :products, :recurring_custom_bill_on, :string
  end
end
