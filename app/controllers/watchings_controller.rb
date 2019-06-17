class WatchingsController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: ここに登録されたcategoryでの新着productｓを表示させる

    # ここテーブル結合とか必要かも。
    # あとでリファクタリングするけど、速さを確認はする。
    # indexのみのほうが早いかも、、、、


    # イメージ
    watchings_category_ids = current_user.categories.pluck(:id)
    watchings_product_ids = ProductCategory.where(category_id: watchings_category_ids).pluck(:product_id) # product_idsに重複はないのかな?


    # test
    puts "-----watchings_category_ids = #{watchings_category_ids}"
    puts "-----watchings_product_ids=#{watchings_product_ids}" # Nil

    @products = Product.where(id: watchings_product_ids).page(params[:page]).per(10)

    @products.each do |watching_product|
      puts "----- watching_product.id = #{watching_product.id}"
    end
    @products
  end
end
