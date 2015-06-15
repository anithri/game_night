class CreateGameSummaryLinks < ActiveRecord::Migration
  def change
    create_table :game_summary_links do |t|
      t.references :game_summary, index: true, foreign_key: true
      t.references :bgg_link, index: true, foreign_key: true
    end
  end
end
