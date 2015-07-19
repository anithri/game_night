class CreateGamesPlayeds < ActiveRecord::Migration
  def change
    create_table :games_playeds do |t|
      t.references :game_session, index: true, foreign_key: true
      t.references :game_summary, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
