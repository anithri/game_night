# == Schema Information
#
# Table name: group_members
#
#  player_id       :uuid
#  gaming_group_id :uuid
#  role            :integer          default(0)
#
# Indexes
#
#  index_group_members_on_gaming_group_id  (gaming_group_id)
#  index_group_members_on_player_id        (player_id)
#

FactoryGirl.define do
  factory :group_member do
    player nil
gaming_group nil
  end

end
