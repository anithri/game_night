class CreateGamingGroups < ActiveRecord::Migration
  def change
    create_table :gaming_groups, id: :uuid do |t|
      t.string :name
      t.text :description
      t.integer :shared_with
      t.string :slug, null: false
      t.timestamps null: false
    end
    add_index :gaming_groups, :slug, unique: true
  end
end
