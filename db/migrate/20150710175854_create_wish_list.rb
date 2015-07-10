class CreateWishList < ActiveRecord::Migration
  def change
    create_table :wish_lists do |t|
      t.uuid :player_id, index: true, foreign_key: true
      t.string :name, null: false
      t.string :slug, null: false
      t.timestamps null: false
    end
    add_index :wish_lists, :slug, unique: true
  end
end
