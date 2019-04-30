# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  goal_price    :integer
#  current_price :integer
#  due_date      :datetime
#  state         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  
  context '' do 
    user = FactoryBot.create :user
    # Normal
    it 'is valid with title, description, goal_price, current_price, due_date, state' do
      product  = Product.new(
        title: "title", description: "description", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: :draft, 
        user_id: user.id
      )
      expect(product).to be_valid
    end

    # Error 
    # Validation
    it 'is invalid with too long title ' do
      product = Product.new(title: "#{'a'*21}")
      product.valid?
      expect(product.errors[:title]).to include("is too long (maximum is 20 characters)")
    end

    it 'is invalid without title' do 
      product = Product.new(title: nil)
      product.valid?
      expect(product.errors[:title]).to include("can't be blank")
    end

    it 'is invalid with too long description' do
      product = Product.new(description: "#{'a'*101}")
      product.valid?
      expect(product.errors[:description]).to include("is too long (maximum is 100 characters)") # TODO: check the instance.erorrs
    end

    it 'is invalid without description' do
      product = Product.new(description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank") # TODO: check the instance.erorrs
    end

    it "is invalid with zero goal price" do
      product = Product.new(goal_price: 0)
      product.valid?
      expect(product.errors[:goal_price]).to include("must be greater than 0")
    end
    
    it 'is invalid with over maximum goal price' do 
      product = Product.new(goal_price: 1000000000000)
      product.valid?
      expect(product.errors[:goal_price]).to include("must be less than 1000000000000")
    end
    
    # TODO
    it 'is invalid without goal price' do
      # TODO 
    end
    it 'is invalid without current price' do
      # TODO 
    end

    it 'is invalid with over maximum current price' do
      # TODO
    end
    
    it 'is invalid with due date before creation time' do
      # TODO
    end
    

    # New 時点で失敗する
    # states
    # it 'is invalid with wrong state' do
    #   product = Product.new(state: 9)
    #   product.valid?
    #   expect(product).to be_valid
    #   #expect(product).to be_invalid
    #   #expect(product.errors[:state]).to include("is not a valid state")
    # end

    # 重複をチェックする
    # ユーザー単位での重複したプロジェクト名を許可しないこと
    it 'does not allow duplicate project names per user' do 
      user.products.create(
        title: "title", description: "description", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )

      new_product = user.products.build(
        title: "title", description: "new description", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )
      new_product.valid?
      expect(new_product.errors[:title]).to include("has already been taken")
    end

    it 'allows two users to share a project name' do
      user.products.create(
        title: "title", description: "description", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )

      other_user = User.create(
        email: "other_user@example.com",
        password: "other_password",
        confirmed_at: Time.zone.now
      )

      other_product = other_user.products.build(
        title: "title", description: "new description", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: other_user.id
      )
      other_product.valid?
      expect(other_product).to be_valid
    end

  end
end