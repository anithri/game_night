class CreateGameLibraries < ActiveRecord::Migration
  def change
    create_table :game_libraries do |t|
      t.uuid :player_id, index: true, foreign_key: true
      t.string :name, null: false
      t.string :slug, null: false
      t.timestamps null: false
    end
    add_index :game_libraries, :slug, unique: true
  end
end
