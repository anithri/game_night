# == Schema Information
#
# Table name: bgg_families
#
#  id                          :integer          not null, primary key
#  name                        :string
#  slug                        :string
#  game_summary_families_count :integer          default(0)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_bgg_families_on_slug  (slug) UNIQUE
#

class BggFamily < ActiveRecord::Base

  has_many :game_summary_families
  has_many :game_summaries, through: :game_summary_families

  extend FriendlyId
  friendly_id :name, use: :slugged

end
