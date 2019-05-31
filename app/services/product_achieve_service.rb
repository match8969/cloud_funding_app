class ProductAchieveService

  def initialize

  end

  def achieve
    # 動作確認OK
    @all_products = Product.includes(:investments)
    product_ids = []
    @all_products.each do |product|
      product_ids.push(product.id) if product.goal_price <= product.investments.where('created_at <= :due_date', due_date: product.due_date ).pluck(:price).sum
    end
    puts "----- product_ids=#{product_ids} -----"
    @products = Product.where(id: product_ids)
    return @products


    # TODO: Refactoring


  end

end