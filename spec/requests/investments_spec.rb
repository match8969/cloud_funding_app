require 'rails_helper'

RSpec.describe "Investments", type: :request do
  describe "GET /investments" do
    it "works! (now write some real specs)" do
      get investments_path
      expect(response).to have_http_status(200)
    end
  end
end
