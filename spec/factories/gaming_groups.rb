# == Schema Information
#
# Table name: gaming_groups
#
#  id          :uuid             not null, primary key
#  name        :string
#  description :text
#  shared_with :integer
#  slug        :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_gaming_groups_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :gaming_group do
    name "MyString"
    description "MyText"
    owner_id ""
  end

end
