class PriceList < ApplicationRecord
  belongs_to :user
  belongs_to :vendor

  has_many :item_details, dependent: :destroy
  has_many :items, through: :item_details
end
