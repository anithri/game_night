class CreateBggCategory < ActiveRecord::Migration
  def change
    create_table :bgg_categories do |t|
      t.integer :bgg_id, index: true, unique: true
      t.string :name

      t.timestamps null: false
    end

  end
end
