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
# Foreign Keys
#
#  fk_rails_b0589b9833  (bgg_designer_id => bgg_designers.id)
#  fk_rails_c183556604  (game_summary_id => game_summaries.id)
#

class GameSummaryDesigner < ActiveRecord::Base
  belongs_to :game_summary
  belongs_to :bgg_designer
end
