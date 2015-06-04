class CreateSessionAttendances < ActiveRecord::Migration
  def change
    create_table :session_attendances do |t|
      t.uuid :game_session, index: true, foreign_key: true
      t.uuid :player, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
