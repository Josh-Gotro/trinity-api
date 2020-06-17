class ItemDetail < ApplicationRecord
  belongs_to :price_list
  # has_many :items
  belongs_to :item
  belongs_to :user
  belongs_to :vendor
end
