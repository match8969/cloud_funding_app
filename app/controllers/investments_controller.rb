class InvestmentsController < ApplicationController
  # Devise 
  before_action :authenticate_user!
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
    @user = current_user
    @product = Product.find(params[:product_id])
    @investment = Investment.new(product_id: @product.id)
    if @product.user_id == @user.id
      redirect_to product_path(@product.id), notice: 'You cannot invest your own product.'
    end
  end

  # GET /investments/1/edit
  def edit
  end

  # POST /investments
  # POST /investments.json
  def create
    @investment = current_user.investments.new(investment_params)
    @product = Product.find(investment_params[:product_id])
    new_current_price = @product.current_price + investment_params[:price].to_i
    
    if new_current_price > @product.goal_price
      # 目標金額に達していた場合には投資できない
      redirect_to new_investment_path(@investment, product_id: @product.id), notice: 'Investment achieved goal price.' and return
    end

    ActiveRecord::Base.transaction do
      @product.update_attributes!(current_price: new_current_price)
      @investment.save
    end
    respond_to do |format|
        format.html { redirect_to @investment, notice: 'Investment was successfully created.' }
        format.json { render :show, status: :created, location: @investment }
    end
    rescue ActiveRecord::RecordInvalid
      respond_to do |format|
        format.html { render :new, notice: 'Already investment achieved goal price.' }
        format.json { render json: @investment.errors, status: :unprocessable_entity }
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
      params.require(:investment).permit(:price, :product_id)
    end
end
