# == Schema Information
#
# Table name: players
#
#  id                :uuid             not null, primary key
#  name              :string
#  player_account_id :uuid
#  public_email      :boolean          default(FALSE)
#  gravatar_email    :string
#  slug              :string           not null
#  shared_with       :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  avatar_url        :string           default("https://dl.dropboxusercontent.com/u/2717187/Pictures/crit_fail.png")
#
# Indexes
#
#  index_players_on_player_account_id  (player_account_id)
#  index_players_on_slug               (slug) UNIQUE
#

FactoryGirl.define do
  factory :player do
    name "MyString"
player_account nil
  end

end
