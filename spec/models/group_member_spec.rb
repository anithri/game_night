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

require 'rails_helper'

RSpec.describe GroupMember, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
