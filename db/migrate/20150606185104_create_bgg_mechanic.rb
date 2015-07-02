class CreateBggMechanic < ActiveRecord::Migration
  def change
    create_table :bgg_mechanics do |t|
      t.string :name
      t.integer :game_summary_mechanics_count, default: 0

      t.timestamps null: false
    end

  end
end
