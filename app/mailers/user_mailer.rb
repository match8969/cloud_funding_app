class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_like_notification
    @to_user = params[:to_user]
    @from_user = params[:from_user]
    @product = params[:product]
    mail(to: @to_user.email, subject: 'あなたのproductがいいねされました')
  end
end
