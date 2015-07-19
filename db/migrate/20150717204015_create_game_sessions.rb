class CreateGameSessions < ActiveRecord::Migration
  def change
    create_table :game_sessions do |t|
      t.date :session_date
      t.string :location
      t.text :notes

      t.timestamps null: false
    end
  end
end
