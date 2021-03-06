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

class Player < ActiveRecord::Base
  has_paper_trail
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :player_account
  has_one :game_library
  has_one :wish_list

  after_create :create_default_library_and_wish_list

  acts_as_voter
  def display_name
    name
  end

  def create_default_library_and_wish_list
    create_game_library(name: "#{name}'s Library")
    create_wish_list(name: "#{name}'s Wish List")
  end
end
