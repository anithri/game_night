# == Schema Information
#
# Table name: bgg_families
#
#  id                          :integer          not null, primary key
#  name                        :string
#  game_summary_families_count :integer          default(0)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#

class BggFamily < ActiveRecord::Base

  has_many :game_summary_families
  has_many :game_summaries, through: :game_summary_families
end
