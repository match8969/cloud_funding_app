class InvestmentsController < ApplicationController
  # Devise 
  before_action :authenticate_user!
  before_action :set_investment, only: [:show, :edit, :update, :destroy]

  # GET /investments
  # GET /investments.json
  def index
    @investments = current_user.investments.page(params[:page]).per(10)
  end

  # GET /investments/1
  # GET /investments/1.json
  def show
  end

  # GET /investments/new
  def new
    product = Product.find(params[:product_id])
    @investment = product.investments.new
    if product.is_owned_by?(current_user.id)
      redirect_to product_path(product.id), notice: 'You cannot invest your own product.'
    end
  end

  # GET /investments/1/edit
  def edit
  end

  # POST /investments
  # POST /investments.json
  def create
    product = Product.find(investment_params[:product_id])
    investment = product.investments.new(investment_params)
    investment.user = current_user

    if !product.investmentable?(investment)
      # 目標金額に達していた場合には投資できない
      redirect_to new_investment_path(investment, product_id: product.id), notice: "You cannot invest over goal price.  ¥#{product.goal_price-product.get_current_price} until goal price!" and return
    end

    respond_to do |format|
      if investment.save
        format.html { redirect_to investment, notice: 'Investment was successfully created.' }
        format.json { render :show, status: :created, location: investment }
      else
        format.html { render :new }
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
      @investment = current_user.investments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def investment_params
      params.require(:investment).permit(:price, :product_id)
    end
end
