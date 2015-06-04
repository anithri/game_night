class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.date :game_date
      t.string :location
      t.text :log
      t.uuid :gaming_group_id, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
