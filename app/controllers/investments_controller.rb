class InvestmentsController < ApplicationController
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  # GET /investments
  # GET /investments.json
  def index
    @investments = Investment.all
  end

  # GET /investments/1
  # GET /investments/1.json
  def show
  end

  # GET /investments/new
  def new
    @investment = Investment.new
    @user = current_user
    @product = Product.find(params[:product_id])
  end

  # GET /investments/1/edit
  def edit
  end

  # POST /investments
  # POST /investments.json
  def create
    @investment = current_user.investments.new(investment_params)
    respond_to do |format|
      if @investment.save && Product.multi_update(investment_params)
        format.html { redirect_to @investment, notice: 'Investment was successfully created.' }
        format.json { render :show, status: :created, location: @investment }
      else
        format.html { render :new }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investments/1
  # PATCH/PUT /investments/1.json
  def update
    respond_to do |format|
      if @investment.update(investment_params)
        format.html { redirect_to @investment, notice: 'Investment was successfully updated.' }
        format.json { render :show, status: :ok, location: @investment }
      else
        format.html { render :edit }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investments/1
  # DELETE /investments/1.json
  def destroy
    @investment.destroy
    respond_to do |format|
      format.html { redirect_to investments_url, notice: 'Investment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investment
      @investment = Investment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.require(:investment).permit(:price, :user_id, :product_id)
    end

    def product_params
      params.require(:product).permit(:price, :product_id)
    end
end
