class CreateBggCategory < ActiveRecord::Migration
  def change
    create_table :bgg_categories do |t|
      t.string :name
      t.string :slug
      t.integer :game_summary_categories_count, default: 0

      t.timestamps null: false
    end
    add_index :bgg_categories, :slug, unique: true

  end
end
