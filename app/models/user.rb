class User < ApplicationRecord
        has_many :price_lists, dependent: :destroy
        has_many :vendors

        has_secure_password
        validates :username, uniqueness: { case_sensitive: false }
end
