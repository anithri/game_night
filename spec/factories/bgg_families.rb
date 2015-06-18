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

FactoryGirl.define do
  factory :bgg_family do
    
  end

end
