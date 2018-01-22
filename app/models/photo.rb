class Photo < ApplicationRecord
  belongs_to :user

  mount_uploader :image, PhotoUploader
  
end
