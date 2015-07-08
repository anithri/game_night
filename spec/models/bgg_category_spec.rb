# == Schema Information
#
# Table name: bgg_categories
#
#  id                            :integer          not null, primary key
#  name                          :string
#  slug                          :string
#  game_summary_categories_count :integer          default(0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#
# Indexes
#
#  index_bgg_categories_on_slug  (slug) UNIQUE
#

require 'rails_helper'

RSpec.describe BggCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
