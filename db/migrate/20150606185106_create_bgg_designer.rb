class CreateBggDesigner < ActiveRecord::Migration
  def change
    create_table :bgg_designers do |t|
      t.string :name

      t.timestamps null: false
    end

  end
end
