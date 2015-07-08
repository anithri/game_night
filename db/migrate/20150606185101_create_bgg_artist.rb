class CreateBggArtist < ActiveRecord::Migration
  def change
    create_table :bgg_artists do |t|
      t.string :name
      t.string :slug
      t.integer :game_summary_artists_count, default: 0
      t.timestamps null: false
    end

    add_index :bgg_artists, :slug, unique: true
  end
end
