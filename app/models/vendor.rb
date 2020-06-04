class Vendor < ApplicationRecord
        has_many :price_lists
        has_many :users, through: :price_lists
end
