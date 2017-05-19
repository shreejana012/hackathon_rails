class Item < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :bid
  validates :user_id,
            :title,
            :description,
            :painter,
            :initial_price,
            :shipping_charges,
            :photo, presence: true
end
