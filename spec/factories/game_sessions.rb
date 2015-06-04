# == Schema Information
#
# Table name: game_sessions
#
#  id              :integer          not null, primary key
#  game_date       :date
#  location        :string
#  log             :text
#  gaming_group_id :uuid
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_sessions_on_gaming_group_id  (gaming_group_id)
#

FactoryGirl.define do
  factory :game_session do
    game_date "2015-06-03"
location "MyString"
log "MyText"
  end

end
