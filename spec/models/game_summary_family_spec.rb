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

require 'rails_helper'

RSpec.describe GameSummaryFamily, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
