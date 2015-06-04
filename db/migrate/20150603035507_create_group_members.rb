class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members do |t|
      t.uuid :player_id, index: true, foreign_key: true
      t.uuid :gaming_group_id, index: true, foreign_key: true
      t.integer :role, default: 0
    end
  end
end
