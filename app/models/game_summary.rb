# == Schema Information
#
# Table name: game_summaries
#
#  id                       :integer          not null, primary key
#  name                     :string
#  thumbnail_url            :string
#  image_url                :string
#  year_published           :integer
#  max_players              :integer
#  min_players              :integer
#  playing_time             :integer
#  description              :text
#  bgg_game_rank            :integer          default(100)
#  game_library_items_count :integer          default(0)
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  wish_list_items_count    :integer          default(0)
#

class GameSummary < ActiveRecord::Base

  has_many :game_library_items

  has_many :game_summary_artists
  has_many :bgg_artists, through: :game_summary_artists

  has_many :game_summary_categories
  has_many :bgg_categories, through: :game_summary_categories

  has_many :game_summary_designers
  has_many :bgg_designers, through: :game_summary_designers

  has_many :game_summary_families
  has_many :bgg_families, through: :game_summary_families

  has_many :game_summary_mechanics
  has_many :bgg_mechanics, through: :game_summary_mechanics

  has_many :game_summary_publishers
  has_many :bgg_publishers, through: :game_summary_publishers

end
