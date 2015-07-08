class CreateBggFamily < ActiveRecord::Migration
  def change
    create_table :bgg_families do |t|
      t.string :name
      t.string :slug
      t.integer :game_summary_families_count, default: 0

      t.timestamps null: false
    end
    add_index :bgg_families, :slug, unique: true

  end
end
