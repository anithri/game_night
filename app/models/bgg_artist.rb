# == Schema Information
#
# Table name: bgg_artists
#
#  id         :integer          not null, primary key
#  bgg_id     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bgg_artists_on_bgg_id  (bgg_id)
#

class BggArtist < ActiveRecord::Base
  has_many :game_summary_artists
  has_many :game_summaries, through: :game_summary_artists
end
