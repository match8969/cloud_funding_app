class WatchingsController < ApplicationController
  before_action :authenticate_user!

  def index
    watchings_category_ids = current_user.watchings.pluck(:category_id)
    watchings_product_ids = ProductCategory.where(category_id: watchings_category_ids).pluck(:product_id)
    @products = Product.includes(:product_category).includes(:categories).where(id: watchings_product_ids)
                    .new_order.page(params[:page]).per(10)
    @categories = Category.where(id: watchings_category_ids)
  end
end
