# == Schema Information
#
# Table name: wish_list_items
#
#  id              :integer          not null, primary key
#  wish_list_id    :integer
#  game_summary_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_wish_list_items_on_game_summary_id                   (game_summary_id)
#  index_wish_list_items_on_wish_list_id                      (wish_list_id)
#  index_wish_list_items_on_wish_list_id_and_game_summary_id  (wish_list_id,game_summary_id) UNIQUE
#

class WishListItem < ActiveRecord::Base
  belongs_to :wish_list
  belongs_to :game_summary, counter_cache: true
end
