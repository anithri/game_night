# == Schema Information
#
# Table name: bgg_mechanics
#
#  id         :integer          not null, primary key
#  bgg_id     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bgg_mechanics_on_bgg_id  (bgg_id)
#

require 'rails_helper'

RSpec.describe BggMechanic, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
