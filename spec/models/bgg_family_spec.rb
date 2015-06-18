# == Schema Information
#
# Table name: bgg_families
#
#  id         :integer          not null, primary key
#  bgg_id     :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bgg_families_on_bgg_id  (bgg_id)
#

require 'rails_helper'

RSpec.describe BggFamily, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
