require 'rails_helper'

RSpec.describe "Products", type: :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:product) { FactoryBot.create(:product)}

  describe "GET #index" do
    it "結果が期待通りであること" do
      get products_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "結果が期待通りであること" do
      get product_path(product.id)
      expect(response).to have_http_status(200)
    end
  end
end
