class Image < ApplicationRecord
    mount_uploader :image, ThumbnailUploader, dependent: :destroy
    belongs_to :product
end
