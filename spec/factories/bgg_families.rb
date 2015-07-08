# == Schema Information
#
# Table name: bgg_families
#
#  id                          :integer          not null, primary key
#  name                        :string
#  slug                        :string
#  game_summary_families_count :integer          default(0)
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#
# Indexes
#
#  index_bgg_families_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :bgg_family do
    
  end

end
