class PriceList < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

  has_many :item_details
  has_many :items, through: :item_details
end
