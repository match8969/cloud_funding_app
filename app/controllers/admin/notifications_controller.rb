class Admin::NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.page(params[:page]).per(10)
    @notifications.update_all(already_read: true)
  end

end
