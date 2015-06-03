class CreateGroupMembers < ActiveRecord::Migration
  def change
    create_table :group_members, id: false do |t|
      t.uuid :player_id, index: true, foreign_key: true
      t.uuid :gaming_group_id, index: true, foreign_key: true
      t.integer :role
    end
  end
end
