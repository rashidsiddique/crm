class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories, join_table: :product_categories
  has_and_belongs_to_many :orders, join_table: :order_products
  
  STATUS_VALUES = { active: 1, inactive: 2, archived: 3 }
  RECUURING_BILLING_TYPE = { :Weekly => 1,  :Monthly => 2, :Quaterly => 3, :Custom => 4}

end
