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

FactoryGirl.define do
  factory :game_summary_family do
    game_summary nil
bgg_family nil
  end

end
