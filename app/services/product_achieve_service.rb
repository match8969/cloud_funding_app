class ProductAchieveService

  def initialize
  end

  def achieve
    product_ids = Product.joins(:investments).includes(:user).select { |product|
      product.goal_price <= product.investments.where('created_at <= :due_date', due_date: product.due_date ).pluck(:price).sum
    }
    @products = Product.where(id: product_ids)
  end

end