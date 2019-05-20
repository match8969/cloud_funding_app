# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#

class Image < ApplicationRecord
    mount_uploader :image, ThumbnailUploader, dependent: :destroy
    belongs_to :product
end
