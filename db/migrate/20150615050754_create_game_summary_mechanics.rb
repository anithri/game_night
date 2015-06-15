class CreateGameSummaryMechanics < ActiveRecord::Migration
  def change
    create_table :game_summary_mechanics, id: false do |t|
      t.references :game_summary, index: true, foreign_key: true
      t.references :bgg_mechanic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
