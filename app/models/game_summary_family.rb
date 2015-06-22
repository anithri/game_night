# == Schema Information
#
# Table name: game_summary_families
#
#  id              :integer          not null, primary key
#  game_summary_id :integer
#  bgg_family_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_summary_families_on_bgg_family_id    (bgg_family_id)
#  index_game_summary_families_on_game_summary_id  (game_summary_id)
#

class GameSummaryFamily < ActiveRecord::Base
  belongs_to :game_summary
  belongs_to :bgg_family
end
