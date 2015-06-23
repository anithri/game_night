# == Schema Information
#
# Table name: bgg_designers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BggDesigner < ActiveRecord::Base
  has_many :game_summary_designers
  has_many :game_summaries, through: :game_summary_designers
end
