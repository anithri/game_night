class CreateGameLibraries < ActiveRecord::Migration
  def change
    create_table :game_libraries do |t|
      t.uuid :player_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
