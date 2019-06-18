require 'rails_helper'

RSpec.describe "Users", type: :request do

  let!(:user) { FactoryBot.create(:user) }
  let!(:params) { FactoryBot.attributes_for(:watching, :user_categories) }

  describe "GET #show" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get user_path(user.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get user_path(user.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #edit" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get edit_user_path(user.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get edit_user_path(user.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "PUT #update" do

    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        put user_path(user.id), params: {user: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        put user_path(user.id), params: {user: params}
        expect(response).to redirect_to user_path(user.id)
      end
    end

  end

end