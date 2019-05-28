require 'rails_helper'

RSpec.describe "Likes", type: :request do

  # TODO: path: products/:id/likes/　のpathを設定する
  #
  let!(:user) { FactoryBot.create(:user) }
  #let!(:product){ FactoryBot.create(:product) }
  let!(:like) { FactoryBot.create(:like, :from_other_user) }
  #let!(:like) { FactoryBot.create(:like) }
  #let!(:params) { FactoryBot.attributes_for(like) }
  let!(:params) { FactoryBot.attributes_for(:like, :from_other_user) }


  #let!(:params) {  }
  #let!(:params) { FactoryBot.attributes_for(:product) }

  describe "POST #create" do
    context "ログインユーザーではない場合" do

      it "結果が期待通りであること" do
        post product_likes_path(like.product_id), params: {like: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        post product_likes_path(like.product_id), params: {like: params}
        expect(response).to have_http_status(302)
      end
    end

  end

  describe "DELETE #destroy" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        delete product_like_path(like.product_id, like.id), params: {like: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        puts "like.id=#{like.id}"
        delete product_like_path(like.product_id, like.id), params: {product_id: like.id}
        expect(response).to redirect_to likes_path
      end
    end

  end

end
