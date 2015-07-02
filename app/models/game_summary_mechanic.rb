# == Schema Information
#
# Table name: game_summary_mechanics
#
#  id              :integer          not null, primary key
#  game_summary_id :integer
#  bgg_mechanic_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_summary_mechanics_on_bgg_mechanic_id  (bgg_mechanic_id)
#  index_game_summary_mechanics_on_game_summary_id  (game_summary_id)
#

class GameSummaryMechanic < ActiveRecord::Base
  belongs_to :game_summary
  belongs_to :bgg_mechanic, counter_cache: true
end
