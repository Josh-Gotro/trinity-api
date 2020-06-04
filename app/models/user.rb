class User < ApplicationRecord
        has_many :price_lists
        has_many :vendors, through: :price_lists

        has_secure_password
        validates :username, uniqueness: { case_sensitive: false }
end
