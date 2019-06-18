FactoryBot.define do
  factory :watching do

    trait :user_categories do
      user_id { FactoryBot.create(:user).id }
      category_id { FactoryBot.create(:category).id }
    end
  end
end
