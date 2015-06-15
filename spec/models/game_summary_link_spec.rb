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

require 'rails_helper'

RSpec.describe GameSummaryLink, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
