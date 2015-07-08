class CreateGameSummaries < ActiveRecord::Migration
  def change
    create_table :game_summaries do |t|
      t.string :name
      t.string :thumbnail_url
      t.string :image_url
      t.integer :year_published
      t.integer :max_players
      t.integer :min_players
      t.integer :playing_time
      t.text :description
      t.integer :bgg_game_rank, default: 100
      t.integer :game_library_items_count, default: 0

      t.timestamps null: false
    end
  end
end
