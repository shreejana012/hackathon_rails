class Bid < ApplicationRecord
  has_many :bids
  validates :user_id,
            :item_id,
            :amount, presence: true
end
