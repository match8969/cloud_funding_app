class Admin::NotificationsController < ApplicationController
  def index
    # TODO
    @notifications = current_user.notifications.page(params[:page]).per(10)

    # TODO
    # ここに「@notifications内にread = falss　の状態のものを trueに変更する」処理を追加

  end

  def create


  end

  def destroy

  end

end
