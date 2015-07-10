class CreateWishListItems < ActiveRecord::Migration
  def change
    create_table :wish_list_items do |t|
      t.references :wish_list, index: true, foreign_key: true
      t.references :game_summary, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_index :wish_list_items, [:wish_list_id, :game_summary_id], unique: true
  end
end
