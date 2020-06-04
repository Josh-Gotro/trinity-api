class CreatePriceLists < ActiveRecord::Migration[6.0]
  def change
    create_table :price_lists do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
