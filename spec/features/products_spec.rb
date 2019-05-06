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
      fill_in "Current price", with: 0

      # TODO: うまくいかない
      # fill_in "Due date", with: Time.zone.now+2.month
      # fill_in  "Due date", with: "#{Time.zone.now+2.month}"
      # fill_in "product_due_date", with: "#{(Time.zone.now+2.month)}"
      # fill_in "product_due_date", with: Time.zone.now+2.month
      # fill_in "product[due_date(1i)]", with: "#{Time.zone.now.year}"
      # fill_in "#product_due_date_1i", with: "#{Time.zone.now.year}"
      # fill_in "product[due_date(1i)]", with: "#{Time.zone.now.month}"

      # category
      fill_in "Category", with: :culture # TODO: make enum categories

      fill_in "State", with: :active
      click_button "Create Product"

      expect(page).to have_content "Product was successfully created"
      
    }.to change(user.products, :count).by(1)
  end
end
