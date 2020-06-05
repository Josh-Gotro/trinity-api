class Item < ApplicationRecord
  has_many :item_details
  has_many :price_lists, through: :item_details
end
