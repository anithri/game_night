# == Schema Information
#
# Table name: bgg_categories
#
#  id                   :integer          not null, primary key
#  bgg_id               :integer
#  name                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  game_summaries_count :integer          default(0)
#
# Indexes
#
#  index_bgg_categories_on_bgg_id  (bgg_id)
#

class BggCategory < ActiveRecord::Base

  has_many :game_summary_categories
  has_many :game_summaries, through: :game_summary_categories
end
