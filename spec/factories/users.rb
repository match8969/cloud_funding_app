# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string(255)
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  address                :string(255)
#  role                   :integer
#

FactoryBot.define do
  factory :user do
    email {"user@example.com"}
    password {"password"}
    confirmed_at {Time.zone.now}
    # 何回 build や create を呼んでも特定のインスタンス (テスト用DBの同一のレコード) を返す Factory が定義できる
    initialize_with { User.find_or_create_by(email: email)}

    trait :other_user do
      email {"other_user@example.com"}
      password {"other_password"}
      confirmed_at {Time.zone.now}
      initialize_with { User.find_or_create_by(email: email)}
    end

    trait :administer_user do
      email {"administer@example.com"}
      password {"administer"}
      role {:administer}
      confirmed_at {Time.zone.now}
      initialize_with { User.find_or_create_by(email: email)}
    end
  end
end
