# == Schema Information
#
# Table name: game_library_items
#
#  id              :integer          not null, primary key
#  game_library_id :integer
#  game_summary_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_game_library_items_on_game_library_id                      (game_library_id)
#  index_game_library_items_on_game_library_id_and_game_summary_id  (game_library_id,game_summary_id) UNIQUE
#  index_game_library_items_on_game_summary_id                      (game_summary_id)
#

require 'rails_helper'

RSpec.describe GameLibraryItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
