class Vendor < ApplicationRecord
        has_many :price_lists, dependent: :destroy
        belongs_to :user
end
