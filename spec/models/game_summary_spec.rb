# == Schema Information
#
# Table name: game_summaries
#
#  id             :integer          not null, primary key
#  name           :string
#  bgg_id         :integer
#  thumbnail_url  :string
#  image_url      :string
#  year_published :integer
#  max_players    :integer
#  min_players    :integer
#  playing_time   :integer
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe GameSummary, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
