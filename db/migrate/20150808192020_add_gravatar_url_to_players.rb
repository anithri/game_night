class AddGravatarUrlToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :avatar_url, :string, default: 'https://dl.dropboxusercontent.com/u/2717187/Pictures/crit_fail.png'
  end
end
