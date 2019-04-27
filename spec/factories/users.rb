# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  address                :string
#

FactoryBot.define do
  factory :user do
    # attribute {value}
    email {"user@example.com"}
    password {"password"}
    # confirmed_at {Time.now}
    confirmed_at {Time.zone.now}

    # 何回 build や create を呼んでも特定のインスタンス (テスト用DBの同一のレコード) を返す Factory が定義できる
    initialize_with { User.find_or_create_by(email: email)}
  end
end
