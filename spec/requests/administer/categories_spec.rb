require 'rails_helper'

RSpec.describe "Administer::Categories", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:administer_user) { FactoryBot.create(:user, :administer_user) }

  describe "GET #index" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end
      it "結果が期待通りであること" do
        get administer_categories_path
        expect(response).to have_http_status(302)
      end
    end
    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end
      it "結果が期待通りであること" do
        get administer_categories_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #show" do
    context "" do
      before do

      end
      it "" do

      end
    end
  end

  describe "GET #edit" do
    context "" do
      before do

      end
      it "" do

      end
    end
  end

  describe "GET #destroy" do
    context "" do
      before do

      end
      it "" do

      end
    end
  end

end
