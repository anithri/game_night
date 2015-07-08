# == Schema Information
#
# Table name: bgg_artists
#
#  id                         :integer          not null, primary key
#  name                       :string
#  slug                       :string
#  game_summary_artists_count :integer          default(0)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_bgg_artists_on_slug  (slug) UNIQUE
#

FactoryGirl.define do
  factory :bgg_artist do
    
  end

end
