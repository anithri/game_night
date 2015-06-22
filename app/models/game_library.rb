# == Schema Information
#
# Table name: game_libraries
#
#  id         :integer          not null, primary key
#  player_id  :uuid
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_game_libraries_on_player_id  (player_id)
#

class GameLibrary < ActiveRecord::Base
  belongs_to :player
end
