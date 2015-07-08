# == Schema Information
#
# Table name: bgg_mechanics
#
#  id                           :integer          not null, primary key
#  name                         :string
#  slug                         :string
#  game_summary_mechanics_count :integer          default(0)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_bgg_mechanics_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :bgg_mechanic do
    
  end

end
