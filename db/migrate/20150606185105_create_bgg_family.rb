class CreateBggFamily < ActiveRecord::Migration
  def change
    create_table :bgg_families do |t|
      t.string :name

      t.timestamps null: false
    end

  end
end
