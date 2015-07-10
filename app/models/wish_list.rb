# == Schema Information
#
# Table name: wish_lists
#
#  id         :integer          not null, primary key
#  player_id  :uuid
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_wish_lists_on_player_id  (player_id)
#  index_wish_lists_on_slug       (slug) UNIQUE
#

class WishList < ActiveRecord::Base
  has_paper_trail
  belongs_to :player
  has_many :wish_list_items
  has_many :game_summaries, through: :wish_list_items

  extend FriendlyId
  friendly_id :name, use: :slugged

end
