class Administer::InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :administer_user, only: [:index]
  
  def index
    @investments = Investment.all
  end

  private
    def administer_user
        redirect_to(root_path, notice: "Permission Error.") unless current_user.is_administer?
    end
end
