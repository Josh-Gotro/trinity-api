class CreateItemDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :item_details do |t|
      t.references :price_list, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.string :pack_size
      t.float :price

      t.timestamps
    end
  end
end
