# == Schema Information
#
# Table name: game_summary_artists
#
#  id              :integer          not null, primary key
#  game_summary_id :integer
#  bgg_artist_id   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_summary_artists_on_bgg_artist_id    (bgg_artist_id)
#  index_game_summary_artists_on_game_summary_id  (game_summary_id)
#

class GameSummaryArtist < ActiveRecord::Base
  belongs_to :game_summary
  belongs_to :bgg_artist, counter_cache: true
end
