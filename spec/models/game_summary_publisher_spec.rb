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

require 'rails_helper'

RSpec.describe GameSummaryPublisher, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
