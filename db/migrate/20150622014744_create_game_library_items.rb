class CreateGameLibraryItems < ActiveRecord::Migration
  def change
    create_table :game_library_items do |t|
      t.references :game_library, index: true, foreign_key: true
      t.references :game_summary, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :game_library_items, [:game_library_id, :game_summary_id], unique: true
  end
end
