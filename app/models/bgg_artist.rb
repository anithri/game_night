# == Schema Information
#
# Table name: bgg_artists
#
#  id                         :integer          not null, primary key
#  name                       :string
#  game_summary_artists_count :integer          default(0)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class BggArtist < ActiveRecord::Base
  has_many :game_summary_artists
  has_many :game_summaries, through: :game_summary_artists
end
