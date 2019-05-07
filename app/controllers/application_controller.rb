class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Devise 
  before_action :authenticate_user!
  
  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

  
end
