# == Schema Information
#
# Table name: gaming_groups
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :text
#  shared_with :integer          default(0)
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_gaming_groups_on_slug  (slug) UNIQUE
#

require 'rails_helper'

RSpec.describe GamingGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
