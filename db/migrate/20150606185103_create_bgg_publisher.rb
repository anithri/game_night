class CreateBggPublisher < ActiveRecord::Migration
  def change
    create_table :bgg_publishers do |t|
      t.string :name
      t.integer :game_summary_publishers_count, default: 0
      t.timestamps null: false
    end
  end
end
