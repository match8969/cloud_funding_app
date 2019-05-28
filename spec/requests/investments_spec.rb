require 'rails_helper'

RSpec.describe "Investments", type: :request do
  let!(:owner) { FactoryBot.create(:user) }
  let!(:user) { FactoryBot.create(:user, :other_user) }
  let!(:own_product) { FactoryBot.create(:product)}
  let!(:user_product) { FactoryBot.create(:product, :other_product)}
  let!(:investment){ FactoryBot.create(:investment) }

  let!(:params) {FactoryBot.attributes_for(:investment)}

  # TODO: Define the goal status
  describe "GET #index" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get administer_investments_path
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        get administer_investments_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #show" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get administer_investment_path(investment.id)
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        get administer_investment_path(investment.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #new" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get new_administer_investment_path
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        get new_administer_investment_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #edit" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get edit_administer_investment_path(investment.id)
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        get edit_administer_investment_path(investment.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "POST #create" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        post administer_investments_path, params: {investment: params}
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        post administer_investments_path, params: {investment: params}
        expect(response).to have_http_status(302)
      end
    end

  end

  describe "PATCH #update" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        put administer_investment_path(investment.id), params: {investment: params}
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        put administer_investment_path(investment.id), params: {investment: params}
        expect(response).to redirect_to administer_investment_path(investment.id)
      end
    end
  end

  describe "GET #destroy" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        delete administer_investment_path(investment.id)
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        delete administer_investment_path(investment.id)
        expect(response).to redirect_to administer_investments_path
      end
    end

  end

end
