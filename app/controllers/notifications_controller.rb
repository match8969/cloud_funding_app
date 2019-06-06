class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.order(updated_at: "DESC").page(params[:page]).per(10)
    @notifications.update_all(already_read: true)
  end

end
