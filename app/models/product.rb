class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories, join_table: :product_categories
end
