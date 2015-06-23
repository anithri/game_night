# == Schema Information
#
# Table name: bgg_artists
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BggArtist < ActiveRecord::Base
  has_many :game_summary_artists
  has_many :game_summaries, through: :game_summary_artists
end
