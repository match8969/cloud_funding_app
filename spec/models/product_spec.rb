# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :text
#  goal_price    :integer
#  current_price :integer          default(0)
#  due_date      :datetime
#  state         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#

require 'rails_helper'

RSpec.describe Product, type: :model do
  # 遅延読み込み
  let!(:user) { FactoryBot.create(:user) }

  describe '#valid?' do
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
  end

  describe '#invalid?' do
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
      expect(product.errors[:description]).to include("is too long (maximum is 100 characters)")
    end

    it 'is invalid without description' do
      product = Product.new(description: nil)
      product.valid?
      expect(product.errors[:description]).to include("can't be blank")
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
    
    it 'is invalid without goal price' do
      product = Product.new(goal_price: nil)
      product.valid?      
      expect(product.errors[:goal_price]).to include("is not a number")
    end
    it 'is invalid without current price' do
      product = Product.new(current_price: nil)
      product.valid?
      expect(product.errors[:current_price]).to include("is not a number")
    end

    it 'is invalid with over maximum current price' do
      product = Product.new(current_price: 1000000000000)
      product.valid?
      expect(product.errors[:current_price]).to include("must be less than 1000000000000")
    end
    
    # TODO: How to describe test that confirm that due date must be set in the future.
    # it 'is invalid with due date before creation time' do
    #   product = Product.new(due_date: Time.zone.now-1.day)
    #   product.valid?
    #   #expect(product).to be_invalid
    #   expect(product.errors[:due_date]).to include("test")
    # end
    

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
