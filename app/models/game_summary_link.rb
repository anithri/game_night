# == Schema Information
#
# Table name: game_summary_links
#
#  id              :integer          not null, primary key
#  game_summary_id :integer
#  bgg_link_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_summary_links_on_bgg_link_id      (bgg_link_id)
#  index_game_summary_links_on_game_summary_id  (game_summary_id)
#

class GameSummaryLink < ActiveRecord::Base
  belongs_to :game_summary
  belongs_to :bgg_link
end
