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

require 'rails_helper'

RSpec.describe GameSummaryMechanic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
