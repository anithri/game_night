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

require 'rails_helper'

RSpec.describe GameSummaryArtist, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
