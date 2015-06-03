# == Schema Information
#
# Table name: gaming_groups
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :text
#  shared_with :integer
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_gaming_groups_on_slug  (slug) UNIQUE
#

class GamingGroup < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  enum shared_with: [:private_group, :summarized_group, :public_group]
  has_many :group_members
  has_many :players, through: :group_members

  validates :name, presence: true, uniqueness: true

  def role_for(player)
    group_members.select{|gm| gm.player_id == player.id}.map(&:role).first.titleize
  end
end
