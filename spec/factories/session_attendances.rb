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

FactoryGirl.define do
  factory :session_attendance do
    game_session ""
player ""
  end

end
