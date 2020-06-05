class ItemDetail < ApplicationRecord
  belongs_to :price_list
  belongs_to :item
  
end
