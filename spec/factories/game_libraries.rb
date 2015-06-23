# == Schema Information
#
# Table name: game_libraries
#
#  id         :integer          not null, primary key
#  player_id  :uuid
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_game_libraries_on_player_id  (player_id)
#  index_game_libraries_on_slug       (slug) UNIQUE
#

FactoryGirl.define do
  factory :game_library do
    player nil
  end

end
