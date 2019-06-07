class UserMailer < ApplicationMailer
  after_action :create_notification
  default from: 'notifications@example.com'

  def send_like_notification
    @to_user = params[:to_user]
    @from_user = params[:from_user]
    @product = params[:product]
    mail(to: @to_user.email, subject: 'あなたのproductがいいねされました')
  end

  def create_notification
    notification = @to_user.notifications.create(content: "#{@from_user.name}さんが#{@product.title}に「いいね」をしました。")
  end
end
