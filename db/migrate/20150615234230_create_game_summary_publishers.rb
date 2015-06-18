class CreateGameSummaryPublishers < ActiveRecord::Migration
  def change
    create_table :game_summary_publishers do |t|
      t.references :game_summary, index: true, foreign_key: true
      t.references :bgg_publisher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
