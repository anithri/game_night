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

require 'rails_helper'

RSpec.describe GameLibrary, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
