class CreateSessionAttendences < ActiveRecord::Migration
  def change
    create_table :session_attendences do |t|
      t.uuid :player, index: true, foreign_key: true
      t.references :game_session, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
