class CreateBggArtist < ActiveRecord::Migration
  def change
    create_table :bgg_artists do |t|
      t.string :name
      t.integer :game_summary_artists_count, default: 0
      t.timestamps null: false
    end

  end
end
