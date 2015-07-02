# == Schema Information
#
# Table name: game_summary_designers
#
#  id              :integer          not null, primary key
#  game_summary_id :integer
#  bgg_designer_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_summary_designers_on_bgg_designer_id  (bgg_designer_id)
#  index_game_summary_designers_on_game_summary_id  (game_summary_id)
#

class GameSummaryDesigner < ActiveRecord::Base
  belongs_to :game_summary
  belongs_to :bgg_designer, counter_cache: true
end
