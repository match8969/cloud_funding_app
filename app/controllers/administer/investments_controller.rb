class Administer::InvestmentsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    current_user.is_administer? ? @investments = Investment.all : redirect_to(root_path, notice: "Permission Error.")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.require(:investment).permit(:price, :product_id)
    end
    
end
