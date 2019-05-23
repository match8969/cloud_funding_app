# == Schema Information
#
# Table name: message_groups
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MessageGroup < ApplicationRecord
  has_many :user_message_group, dependent: :destroy
  has_many :users, through: :user_message_group
  has_many :messages, dependent: :destroy


  # TODO: 組み合わせの重複に関して validateとuniqueの使用方法が不明,,,
  # TODO: message_group:  id -> 作成をsaveして生成なので重複チェック無理
  # TODO: message.users のメンバーが 他のmessage_groupに存在しない
  # 　が必要,,,

  #
  #validates
  #validates_associated :users, uniqueness: true
  #validates_associated :users, uniqueness: { scope: :email }
  #validates_uniqueness_of
  #


end
