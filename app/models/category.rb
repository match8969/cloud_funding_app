class Category < ApplicationRecord
  has_many :product_category
  has_many :products, through: :product_category 
end
