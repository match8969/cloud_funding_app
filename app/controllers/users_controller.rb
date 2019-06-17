class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    
  end
  
  def update
    # TODO: current_user.categoriesの更新処理
    respond_to do |format|
      if current_user.update(user_params)
      # if @user.update(user_params)
        format.html { redirect_to current_user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(category_ids: [])
  end

end
