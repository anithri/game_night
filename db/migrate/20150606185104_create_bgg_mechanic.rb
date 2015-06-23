class CreateBggMechanic < ActiveRecord::Migration
  def change
    create_table :bgg_mechanics do |t|
      t.string :name

      t.timestamps null: false
    end

  end
end
