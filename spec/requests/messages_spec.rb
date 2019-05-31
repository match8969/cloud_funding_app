require 'rails_helper'

RSpec.describe "Messages", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:other_user) { FactoryBot.create(:user, :other_user) }
  let!(:message) { FactoryBot.create(:message) }
  let!(:params) { FactoryBot.attributes_for(:message) }

  describe "GET #index" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get messages_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get messages_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #show" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get message_path(message.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get message_path(message.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #new" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get new_message_path
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get new_message_path
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "GET #edit" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        get edit_message_path(message.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        get edit_message_path(message.id)
        expect(response).to have_http_status(200)
      end
    end

  end

  describe "POST #create" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        post messages_path, params: {message: :user_ids}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        post messages_path, params: {message: params}
        expect(response).to have_http_status(302)
      end

      it "結果が期待通りであること" do
        expect do
          post messages_path, params: {message: params}
        end.to change(Message, :count).by(1)
      end
    end

  end

  describe "PUT #update" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        put message_path(message.id), params: {message: params}
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        put message_path(message.id), params: {message: params}
        expect(response).to redirect_to message_path(message.id)
      end
    end

  end

  describe "DELETE #destroy" do
    context "ログインユーザーではない場合" do
      it "結果が期待通りであること" do
        delete message_path(message.id)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context "ログインユーザーの場合" do
      before do
        sign_in user
      end

      it "結果が期待通りであること" do
        delete message_path(message.id)
        expect(response).to redirect_to messages_path
      end

      it "結果が期待通りであること" do
        expect do
          delete message_path(message.id)
        end.to change(Message, :count).by(-1)
      end
    end

  end

end
