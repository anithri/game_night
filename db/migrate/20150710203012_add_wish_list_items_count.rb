class AddWishListItemsCount < ActiveRecord::Migration
  def change
    add_column :game_summaries, :wish_list_items_count, :integer , default: 0
  end
end
