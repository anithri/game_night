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
#  shared_with       :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_players_on_player_account_id  (player_account_id)
#  index_players_on_slug               (slug) UNIQUE
#

class Player < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :player_account
  has_many :group_memberships, class_name: GroupMember
  has_many :gaming_groups, through: :memberships
end
