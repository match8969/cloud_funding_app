class Administer::InvestmentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    administer_user(current_user) ? @investments = Investment.all : redirect_to(root_path, notice: "Permission Error.")
  end

  private
    def administer_user(user)
      user.role_before_type_cast == User.roles[:administer]
    end
end
