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

class GameLibrary < ActiveRecord::Base
  belongs_to :player
  has_many :game_library_items
  has_many :game_summaries, through: :game_library_items

  extend FriendlyId
  friendly_id :name, use: :slugged

end
