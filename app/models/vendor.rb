class Vendor < ApplicationRecord
        has_many :price_lists, dependent: :destroy
        has_many :users, through: :price_lists
end
