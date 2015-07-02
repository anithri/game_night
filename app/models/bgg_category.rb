# == Schema Information
#
# Table name: bgg_categories
#
#  id                            :integer          not null, primary key
#  name                          :string
#  game_summary_categories_count :integer          default(0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

class BggCategory < ActiveRecord::Base

  has_many :game_summary_categories
  has_many :game_summaries, through: :game_summary_categories
end
