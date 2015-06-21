# == Schema Information
#
# Table name: game_libraries
#
#  id             :integer          not null, primary key
#  librarian_id   :integer
#  librarian_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_game_libraries_on_librarian_type_and_librarian_id  (librarian_type,librarian_id)
#

class GameLibrary < ActiveRecord::Base
  belongs_to :librarian, polymorphic: true
  has_many :game_library_items
  has_many :game_summaries, through: :game_library_items

  accepts_nested_attributes_for :game_library_items, reject_if: :all_blank, allow_destroy: true
end
