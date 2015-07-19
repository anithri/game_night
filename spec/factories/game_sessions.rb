# == Schema Information
#
# Table name: game_sessions
#
#  id           :integer          not null, primary key
#  session_date :date
#  location     :string
#  notes        :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :game_session do
    session_date "2015-07-17"
location "MyString"
notes "MyText"
  end

end
