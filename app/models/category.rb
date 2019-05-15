class Category < ApplicationRecord
  has_many :product_category
  has_many :product, through: :product_category 
end
