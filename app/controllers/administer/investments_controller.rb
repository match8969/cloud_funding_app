class Administer::InvestmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :administer_user, only: [:index]
  
  def index
    @investments = Investment.all
  end
    
end
