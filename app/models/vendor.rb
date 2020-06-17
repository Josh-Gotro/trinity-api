class Vendor < ApplicationRecord
        has_many :price_lists, dependent: :destroy
        belongs_to :user

        validates :name, uniqueness: { case_sensitive: false }
        validates :name, presence: true
        validates :user_id, presence: true
end
