class AddUserRefToVendors < ActiveRecord::Migration[6.0]
  def change
    add_reference :vendors, :user, null: false, foreign_key: true
  end
end
