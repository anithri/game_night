class CreateGameSummaryCategories < ActiveRecord::Migration
  def change
    create_table :game_summary_categories do |t|
      t.references :game_summary, index: true, foreign_key: true
      t.references :bgg_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
