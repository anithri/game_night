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

FactoryGirl.define do
  factory :games_played do
    session nil
game_summary nil
  end

end
