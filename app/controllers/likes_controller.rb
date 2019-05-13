class LikesController < ApplicationController
  def create
    if Product.find(params[:product_id]).is_owned_by?(current_user.id)
      redirect_back(fallback_location: root_path, notice: 'You cannot add いいね to your own products.')
    else
      like = current_user.likes.create(product_id: params[:product_id])
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    like = Like.find_by(product_id: params[:product_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end
