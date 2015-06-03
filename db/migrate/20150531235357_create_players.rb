class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players, id: :uuid do |t|
      t.string :name
      t.uuid :player_account_id, index: true, foreign_key: true
      t.boolean :public_email, default: false
      t.string :gravatar_email
      t.timestamps null: false
    end
  end
end
