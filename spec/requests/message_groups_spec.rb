require 'rails_helper'

RSpec.describe "MessageGroups", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user, :other_user) }
  let!(:message_group) { FactoryBot.create(:message_group) }
  let!(:params) { FactoryBot.attributes_for(:message_group, :other_user_ids) }

  describe "GET #index" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get message_groups_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end
      it "結果が期待通りであること" do
        get message_groups_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #show" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get message_group_path(message_group.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end
      it "結果が期待通りであること" do
        get message_group_path(message_group.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #new" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get new_message_group_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end
      it "結果が期待通りであること" do
        get new_message_group_path
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "GET #edit" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get edit_message_group_path(message_group.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end
      it "結果が期待通りであること" do
        get edit_message_group_path(message_group.id)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "POST #create" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        post message_groups_path, params: {message_group: :user_ids}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end
      it "結果が期待通りであること" do
        post message_groups_path, params: {message_group: params}
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "PUT #update" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        put message_group_path(message_group.id), params: {message_group: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end
      it "結果が期待通りであること" do
        put message_group_path(message_group.id), params: {message_group: params}
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "DELETE #destroy" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        delete message_group_path(message_group.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end
      it "結果が期待通りであること" do
        delete message_group_path(message_group.id)
        expect(response).to have_http_status(302)
      end
    end
  end
end
