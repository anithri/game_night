class CreateBggFamily < ActiveRecord::Migration
  def change
    create_table :bgg_families do |t|
      t.string :name
      t.integer :game_summary_families_count, default: 0

      t.timestamps null: false
    end

  end
end
