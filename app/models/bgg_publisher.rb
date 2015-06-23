# == Schema Information
#
# Table name: bgg_publishers
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BggPublisher < ActiveRecord::Base
  has_many :game_summary_publishers
  has_many :game_summaries, through: :game_summary_publishers
end
