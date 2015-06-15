class CreateBggLinks < ActiveRecord::Migration
  def change
    create_table :bgg_links do |t|
      t.integer :bgg_id
      t.string :name
      t.string :type

      t.timestamps null: false
    end

    add_index :bgg_links, [:bgg_id,:type], unique: true
  end
end
