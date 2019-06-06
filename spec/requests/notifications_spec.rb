require 'rails_helper'

RSpec.describe "Notifications", type: :request do

  let!(:user) { FactoryBot.create(:user) }
  let!(:notification) { FactoryBot.create(:notification) }

  describe "GET #index" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get notifications_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
        notification
      end
      
      it "結果が期待通りであること" do
        get notifications_path
        expect(response).to have_http_status(200)
      end

      it "結果が期待通りであること" do
        expect do
          get notifications_path
        end.to change { notification.reload.already_read }.from(false).to(true)
      end
    end

  end
  
end