# == Schema Information
#
# Table name: game_summary_links
#
#  id              :integer          not null, primary key
#  game_summary_id :integer
#  bgg_link_id     :integer
#
# Indexes
#
#  index_game_summary_links_on_bgg_link_id      (bgg_link_id)
#  index_game_summary_links_on_game_summary_id  (game_summary_id)
#

FactoryGirl.define do
  factory :game_summary_link do
    game_summary nil
bgg_link nil
  end

end
