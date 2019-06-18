require 'rails_helper'

RSpec.describe "Watchings", type: :request do

  let!(:user) { FactoryBot.create(:user) }

  describe "GET #index" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get watchings_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get watchings_path
        expect(response).to have_http_status(200)
      end
    end

  end

end