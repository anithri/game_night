class CreateGameLibraries < ActiveRecord::Migration
  def change
    create_table :game_libraries do |t|
      t.references :librarian, index: true, polymorphic: true

      t.timestamps null: false
    end
  end
end
