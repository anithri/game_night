# == Schema Information
#
# Table name: bgg_categories
#
#  id                   :integer          not null, primary key
#  bgg_id               :integer
#  name                 :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  game_summaries_count :integer          default(0)
#
# Indexes
#
#  index_bgg_categories_on_bgg_id  (bgg_id)
#

require 'rails_helper'

RSpec.describe BggCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
