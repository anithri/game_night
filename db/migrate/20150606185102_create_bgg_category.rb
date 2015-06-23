class CreateBggCategory < ActiveRecord::Migration
  def change
    create_table :bgg_categories do |t|
      t.string :name

      t.timestamps null: false
    end

  end
end
