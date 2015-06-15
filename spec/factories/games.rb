# == Schema Information
#
# Table name: games
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

FactoryGirl.define do
  factory :game_summary do
    name "MyString"
bgg_id 1
thumbnail_url "MyString"
image_url "MyString"
year_published 1
max_players ""
min_players ""
playing_time 1
description "MyText"
  end

end
