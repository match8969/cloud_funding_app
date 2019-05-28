require 'rails_helper'

RSpec.describe "Administer::Categories", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:administer_user) { FactoryBot.create(:user, :administer_user) }
  let!(:category){ FactoryBot.create(:category) }
  let!(:params) {FactoryBot.attributes_for(:category)}

  describe "GET #index" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get administer_categories_path
        expect(response).to redirect_to root_path
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
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get administer_category_path(category.id)
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        get administer_category_path(category.id)
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
        get new_administer_category_path
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        get new_administer_category_path
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
        get edit_administer_category_path(category.id)
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        get edit_administer_category_path(category.id)
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
        post administer_categories_path, params: {category: params}
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end
      it "結果が期待通りであること" do
        post administer_categories_path, params: {category: params}
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
        put administer_category_path(category.id), params: {category: params}
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        put administer_category_path(category.id), params: {category: params}
        expect(response).to redirect_to administer_category_path(category.id)
      end
    end

  end

  describe "GET #destroy" do
    context "administerユーザーではない場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        delete administer_category_path(category.id)
        expect(response).to redirect_to root_path
      end
    end

    context "administerユーザーの場合" do
      before do
        sign_in administer_user
      end

      it "結果が期待通りであること" do
        delete administer_category_path(category.id)
        expect(response).to redirect_to administer_categories_path
      end
    end

  end

end
