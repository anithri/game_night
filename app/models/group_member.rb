# == Schema Information
#
# Table name: group_members
#
#  player_id       :uuid
#  gaming_group_id :uuid
#  role            :integer
#
# Indexes
#
#  index_group_members_on_gaming_group_id  (gaming_group_id)
#  index_group_members_on_player_id        (player_id)
#

class GroupMember < ActiveRecord::Base
  belongs_to :player
  belongs_to :gaming_group

  enum role: [:non_member, :member, :co_host, :host, :owner]
end