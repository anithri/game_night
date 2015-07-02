# == Schema Information
#
# Table name: bgg_mechanics
#
#  id                           :integer          not null, primary key
#  name                         :string
#  game_summary_mechanics_count :integer          default(0)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class BggMechanic < ActiveRecord::Base
  has_many :game_summary_mechanics
  has_many :game_summaries, through: :game_summary_mechanics
end
