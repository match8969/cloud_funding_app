class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.order(updated_at: "DESC").page(params[:page]).per(10)

    # TODO:
    # 1.change to reat_at : datatime
    # 2.chane to only unread notifications

    # TODO: Userクラスのunreadのメソッド完成
    unread_notifications = current_user.unread_notifications
    unread_notifications.update_all(read_at: Time.zone.now)
  end

end
