# == Schema Information
#
# Table name: game_summary_publishers
#
#  id               :integer          not null, primary key
#  game_summary_id  :integer
#  bgg_publisher_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_game_summary_publishers_on_bgg_publisher_id  (bgg_publisher_id)
#  index_game_summary_publishers_on_game_summary_id   (game_summary_id)
#

class GameSummaryPublisher < ActiveRecord::Base
  belongs_to :game_summary
  belongs_to :bgg_publisher
end
