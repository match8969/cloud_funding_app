class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

  
end
