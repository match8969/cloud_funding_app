require 'rails_helper'

RSpec.describe "Admin::Products", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product)}
  let!(:params) {FactoryBot.attributes_for(:product)}
  # userとtitleのunique制約下でcreateアクション実行のため
  let!(:new_params) {FactoryBot.attributes_for(:product, :new_product)}

  describe "GET #index" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get admin_products_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get admin_products_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #show" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get admin_product_path(product.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get admin_product_path(product.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #new" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get new_admin_product_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get new_admin_product_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #edit" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get edit_admin_product_path(product.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get edit_admin_product_path(product.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "POST #create" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        post admin_products_path, params: {product: new_params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        post admin_products_path, params: {product: new_params}
        expect(response).to have_http_status(302)
      end

      it "結果が期待通りであること" do
        expect do
          post admin_products_path, params: {product: new_params}
        end.to change(Product, :count).by(1)
      end
    end

  end

  describe "PUT #update" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        put admin_product_path(product.id), params: {product: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        put admin_product_path(product.id), params: {product: params}
        expect(response).to have_http_status(302)
      end
    end

  end

  describe "DELETE #destroy" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        delete admin_product_path(product.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        delete admin_product_path(product.id)
        expect(response).to have_http_status(302)
      end

      it "結果が期待通りであること" do
        expect do
          delete admin_product_path(product.id)
        end.to change(Product, :count).by(-1)
      end
    end

  end

end
