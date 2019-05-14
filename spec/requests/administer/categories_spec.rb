require 'rails_helper'

RSpec.describe "Administer::Categories", type: :request do
  describe "GET /administer/categories" do
    it "works! (now write some real specs)" do
      get administer_categories_index_path
      expect(response).to have_http_status(200)
    end
  end
end
