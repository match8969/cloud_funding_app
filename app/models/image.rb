# == Schema Information
#
# Table name: images
#
#  id         :bigint(8)        not null, primary key
#  image      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint(8)
#

class Image < ApplicationRecord
    mount_uploader :image, ThumbnailUploader, dependent: :destroy
    belongs_to :product
end
