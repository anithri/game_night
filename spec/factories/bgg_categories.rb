# == Schema Information
#
# Table name: bgg_categories
#
#  id                            :integer          not null, primary key
#  name                          :string
#  game_summary_categories_count :integer          default(0)
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#

FactoryGirl.define do
  factory :bgg_category do
    
  end

end
