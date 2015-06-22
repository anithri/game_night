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

FactoryGirl.define do
  factory :game_summary_designer do
    game_summary nil
bgg_designer nil
  end

end
