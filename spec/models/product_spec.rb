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
  # pending "add some examples to (or delete) #{__FILE__}"

  # TODO: create User for user_id 
  context '' do 
    user = FactoryBot.create :user
    # Normal
    it 'is valid with title, description, goal_price, current_price, due_date, state' do
      
      product  = Product.new(
        id: 1, title: "title", description: "description", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )
      expect(product).to be_valid
    end


    # Error 
    # Validation
    it 'is invalid with too long title ' do
      product = Product.new(
        id: 1, 
        title: "#{'a'*21}",
        description: "description", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )
      expect(product).to be_invalid
    end

    it 'is invalid without title' do 
      product  = Product.new(
        id: 1, title: "", description: "description", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )
      expect(product).to be_invalid
    end

    it 'is invalid with too long description' do
      product = Product.new(
        id: 1, title: "title", description: "#{'d'*101}", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )
      expect(product).to be_invalid
    end

    it 'is invalid without description' do
      product = Product.new(
        id: 1, title: "title", description: "", 
        goal_price: 10000, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )
      expect(product).to be_invalid
    end

    it "is invalid with zero goal price" do
      product  = Product.new(
        id: 1, title: "", description: "desc test1", 
        goal_price: 0, current_price: 0,
        due_date: (Time.now+2.month), state: 0, 
        user_id: user.id
      )
      expect(product).to be_invalid
    end
    
    it 'is invalid with maximum goal price' do 
    end
    it 'is invalid with z goal price' do 
    end
    it 'cannot have negative goal price' do 
    end
    it 'cannnot have maximum maximum price' do 
    end
    it 'cannot have  negative price' do 
    end



  end
end
