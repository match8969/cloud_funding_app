class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.order(updated_at: "DESC").page(params[:page]).per(10)
    unread_notifications = current_user.unread_notifications
    unread_notifications.update_all(read_at: Time.zone.now) if unread_notifications.present?
  end

end
