# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do

  describe '#valid?' do
    it 'is valid with name' do 
      category = Category.new(
        name: "name"
      )
      expect(category).to be_valid
    end
  end

  describe '#invalid?' do
    it 'is invalid without name' do 
      category= Category.new(
        name: nil
      )
      category.valid?
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'is invalid with too long name' do
      category= Category.new(
        name: "#{'a'*21}"
      )
      category.valid?
      expect(category.errors[:name]).to include("is too long (maximum is 20 characters)")
    end
  end


end
