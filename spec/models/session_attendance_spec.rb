# == Schema Information
#
# Table name: session_attendances
#
#  id           :integer          not null, primary key
#  game_session :uuid
#  player       :uuid
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_session_attendances_on_game_session  (game_session)
#  index_session_attendances_on_player        (player)
#

require 'rails_helper'

RSpec.describe SessionAttendance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
