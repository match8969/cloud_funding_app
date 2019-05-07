class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :goal_price, :current_price, :due_date, :state)
    end
end
