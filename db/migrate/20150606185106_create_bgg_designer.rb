class CreateBggDesigner < ActiveRecord::Migration
  def change
    create_table :bgg_designers do |t|
      t.string :name
      t.string :slug
      t.integer :game_summary_designers_count, default: 0

      t.timestamps null: false
    end

    add_index :bgg_designers, :slug, unique: true
  end
end
