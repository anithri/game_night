# == Schema Information
#
# Table name: games_playeds
#
#  id              :integer          not null, primary key
#  game_session_id :integer
#  game_summary_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_games_playeds_on_game_session_id  (game_session_id)
#  index_games_playeds_on_game_summary_id  (game_summary_id)
#

require 'rails_helper'

RSpec.describe GamesPlayed, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
