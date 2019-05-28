require 'rails_helper'

RSpec.describe "Likes", type: :request do

  # TODO: path: products/:id/likes/　のpathを設定する
  #
  let!(:user) { FactoryBot.create(:user) }
  let!(:product){ FactoryBot.create(:product) }
  let!(:like) { FactoryBot.create(:like, :from_other_user) }
  let!(:params) { FactoryBot.attributes_for(:like) }

  describe "POST #create" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        post product_likes_path, params: {product_id: product.id, like: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        post product_likes_path, params: {like: params}
        expect(response).to have_http_status(302)
      end
    end

  end

  describe "DELETE #destroy" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        delete product_like_path(like.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        delete product_like_path(like.id)
        expect(response).to redirect_to likes_path
      end
    end

  end

end
