require 'rails_helper'

RSpec.describe "Administer::Investments", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:administer_user) { FactoryBot.create(:user, :administer_user) }
  let!(:investment){ FactoryBot.create(:investment) }
  let!(:params) {FactoryBot.attributes_for(:investment)}

  describe "GET #index" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get administer_investments_index_path
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        get administer_investments_index_path
        expect(response).to have_http_status(200)
      end
    end

  end
end

