require 'rails_helper'

RSpec.describe "MessageGroups", type: :request do
  describe "GET /message_groups" do
    it "works! (now write some real specs)" do
      get message_groups_path
      expect(response).to have_http_status(200)
    end
  end
end
