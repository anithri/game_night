# == Schema Information
#
# Table name: game_library_items
#
#  id              :integer          not null, primary key
#  game_summary_id :integer
#  game_library_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_library_items_on_game_library_id  (game_library_id)
#  index_game_library_items_on_game_summary_id  (game_summary_id)
#

FactoryGirl.define do
  factory :game_library_item do
    game nil
library nil
  end

end
