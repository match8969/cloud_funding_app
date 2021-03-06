require 'rails_helper'

RSpec.describe "Likes", type: :request do

  let!(:other_user) { FactoryBot.create(:user, :other_user) }
  let!(:product) { FactoryBot.create(:product) }
  let!(:like) { FactoryBot.create(:like, :from_other_user) }
  let!(:params) { FactoryBot.attributes_for(:like) }
  let!(:notification) { FactoryBot.create(:notification) }

  describe "POST #create" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        post product_likes_path(like.product_id), params: {like: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in other_user
      end

      it "結果が期待通りであること" do
        post product_likes_path(product.id), params: {like: params}
        expect(response).to have_http_status(302)
      end

      it "結果が期待通りであること" do
        expect do
          post product_likes_path(product.id), params: {like: params}
        end.to change(Like, :count).by(1)
      end

      it "結果が期待通りであること" do
        expect do
          post product_likes_path(product.id), params: {like: params}
        end.to change(Notification, :count).by(1)
      end
    end

  end

  describe "DELETE #destroy" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        delete product_like_path(like.product_id, like.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in other_user
      end

      it "結果が期待通りであること" do
        delete product_like_path(like.product_id, like.id)
        expect(response).to have_http_status(302)
      end

      it "結果が期待通りであること" do
        expect do
          delete product_like_path(like.product_id, like.id)
        end.to change(Like, :count).by(-1)
      end
    end

  end

end
