class LikesController < ApplicationController
  before_action :authenticate_user!

  # mailerは引数が欲しいので after_actionではないほうがよいかも
  # after_action :send_email_to_product_owner, only: [:create] # OK

  def create
    if Product.find(params[:product_id]).is_owned_by?(current_user.id)
      redirect_back(fallback_location: root_path, notice: 'You cannot add いいね to your own products.')
    else
      like = current_user.likes.create(product_id: params[:product_id])
      # Mailの送信
      send_email_to_product_owner(like)

      # 通知履歴の生成
      # TODO: NG, current_userでcreateすると 「いいね」した人のnotificationになる
      notification = like.product.user.notifications.create #TODO: Add content when 「送信情報」defined

      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end

  def send_email_to_product_owner(like)
    UserMailer.with(to_user: like.product.user, from_user: like.user, product: like.product)
        .like_notification_email.deliver_now
  end

  # TODO: これはUserモデルがよいのでは??
  # というかcreateを関数内部は危険では??
  def create_notification
    # TODO
    puts "#create_notification"
    self.notifications.create
  end

end
