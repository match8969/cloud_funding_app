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
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get investments_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in owner
      end

      it "結果が期待通りであること" do
        get investments_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #show" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get investment_path(investment.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in owner
      end

      it "結果が期待通りであること" do
        get investment_path(investment.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #new" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get new_investment_path, params: {product_id: user_product.id}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in owner
      end

      it "結果が期待通りであること" do
        get new_investment_path, params: {product_id: user_product.id}
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #edit" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get edit_investment_path(investment.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in owner
      end

      it "結果が期待通りであること" do
        get edit_investment_path(investment.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "POST #create" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        post investments_path, params: {investment: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in owner
      end

      it "結果が期待通りであること" do
        puts "investment.product.id=#{investment.product.id}"
        post investments_path, params: {investment: params}
        expect(response).to have_http_status(302)
      end
    end

  end

  describe "PATCH #update" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        put investment_path(investment.id), params: {investment: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in owner
      end

      it "結果が期待通りであること" do
        put investment_path(investment.id), params: {investment: params}
        expect(response).to redirect_to investment_path(investment.id)
      end
    end
  end

  describe "GET #destroy" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        delete investment_path(investment.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in owner
      end

      it "結果が期待通りであること" do
        delete investment_path(investment.id)
        expect(response).to redirect_to investments_path
      end
    end

  end

end
