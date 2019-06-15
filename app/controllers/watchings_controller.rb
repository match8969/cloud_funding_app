class WatchingsController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: ここに登録されたcategoryでの新着productｓを表示させる

    # ここテーブル結合とか必要かも。
    # あとでリファクタリングするけど、速さを確認はする。
    # indexのみのほうが早いかも、、、、


    # イメージ
    watchings_category_ids = current_user.categories.pluck(:id)
    watchings_product_ids = ProductCategory.where(category_id: watchings_category_ids) # product_idsに重複はないのかな?
    @watching_products = Product.where(id: watchings_product_ids)
  end
end
