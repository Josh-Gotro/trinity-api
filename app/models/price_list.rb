class PriceList < ApplicationRecord
  belongs_to :user
  belongs_to :vendor
end
