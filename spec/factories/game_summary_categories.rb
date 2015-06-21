# == Schema Information
#
# Table name: game_summary_categories
#
#  id              :integer          not null, primary key
#  game_summary_id :integer
#  bgg_category_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_summary_categories_on_bgg_category_id  (bgg_category_id)
#  index_game_summary_categories_on_game_summary_id  (game_summary_id)
#
# Foreign Keys
#
#  fk_rails_202c377bb5  (bgg_category_id => bgg_categories.id)
#  fk_rails_a57a339eeb  (game_summary_id => game_summaries.id)
#

FactoryGirl.define do
  factory :game_summary_category do
    game_summary nil
bgg_category nil
  end

end
