# == Schema Information
#
# Table name: session_attendences
#
#  id              :integer          not null, primary key
#  player          :uuid
#  game_session_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_session_attendences_on_game_session_id  (game_session_id)
#  index_session_attendences_on_player           (player)
#

class SessionAttendence < ActiveRecord::Base
  belongs_to :game_session
end
