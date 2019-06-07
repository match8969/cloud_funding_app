class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    if Product.find(params[:product_id]).is_owned_by?(current_user.id)
      redirect_back(fallback_location: root_path, notice: 'You cannot add いいね to your own products.')
    else
      like = current_user.likes.create(product_id: params[:product_id])
      # Mailの送信
      UserMailer.with(to_user: like.product.user, from_user: like.user, product: like.product)
          .send_like_notification.deliver_now
      # 通知履歴の生成
      notification = like.product.user.notifications
                         .create(content: "#{current_user.name}さんが#{like.product.title}に「いいね」をしました。")
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
