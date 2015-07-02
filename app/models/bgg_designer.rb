# == Schema Information
#
# Table name: bgg_designers
#
#  id                           :integer          not null, primary key
#  name                         :string
#  game_summary_designers_count :integer          default(0)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class BggDesigner < ActiveRecord::Base
  has_many :game_summary_designers
  has_many :game_summaries, through: :game_summary_designers
end
