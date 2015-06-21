# == Schema Information
#
# Table name: bgg_publishers
#
#  id         :integer          not null, primary key
#  bgg_id     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bgg_publishers_on_bgg_id  (bgg_id)
#

class BggPublisher < ActiveRecord::Base
  has_many :game_summary_publishers
  has_many :game_summaries, through: :game_summary_publishers
end
