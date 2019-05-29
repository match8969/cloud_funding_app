require 'rails_helper'

RSpec.feature "Products", type: :feature do
  # サポートモジュールの使用 (spec/support/login_support.rb)
  include LoginSupport

  # ユーザーは新しいプロジェクトを作成する
  scenario "user creates a new product" do 
    user = FactoryBot.create(:user)

    #sign_in_as user
    sign_in user
    visit root_path
    # click_link "Log in"
    # fill_in "Email", with: user.email
    # fill_in "Password", with: user.password
    # click_button "Log in"

    expect {
      click_link "New Product"
      fill_in "Title", with: "Test Product"
      fill_in "Description", with: "Trying out Capybara"
      fill_in "Goal price", with: 10000

      # TODO: うまくいかない
      # fill_in "Due date", with: Time.zone.now+2.month
      # fill_in  "Due date", with: "#{Time.zone.now+2.month}"
      # fill_in "product_due_date", with: "#{(Time.zone.now+2.month)}"
      # fill_in "product_due_date", with: Time.zone.now+2.month
      # fill_in "product[due_date(1i)]", with: "#{Time.zone.now.year}"
      # fill_in "#product_due_date_1i", with: "#{Time.zone.now.year}"
      # fill_in "product[due_date(1i)]", with: "#{Time.zone.now.month}"

      # State
      select :active, from: 'product[state]', visible: false

      click_button "Create Product"

      expect(page).to have_content "Product was successfully created"
      
    }.to change(user.products, :count).by(1)
  end

  # scenario "user creates new investment" do
  #   user = FactoryBot.create(:user)
  #   product = FactoryBot.create(:product)
  #
  #   sign_in user
  #   visit root_path
  #
  #   expect {
  #     click_link "Show", href: product_path(product)
  #     click_link "Invest"
  #     fill_in "Price", with: 10000
  #     click_button "Create Investment"
  #   }.to change(user.investments, :count).by(1)
  # end
end
