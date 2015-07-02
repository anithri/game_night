class CreateBggDesigner < ActiveRecord::Migration
  def change
    create_table :bgg_designers do |t|
      t.string :name
      t.integer :game_summary_designers_count, default: 0

      t.timestamps null: false
    end

  end
end
