class CreateBggMechanic < ActiveRecord::Migration
  def change
    create_table :bgg_mechanics do |t|
      t.string :name
      t.string :slug
      t.integer :game_summary_mechanics_count, default: 0

      t.timestamps null: false
    end
    add_index :bgg_mechanics, :slug, unique: true

  end
end
