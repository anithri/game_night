# == Schema Information
#
# Table name: bgg_links
#
#  id         :integer          not null, primary key
#  bgg_id     :integer
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bgg_links_on_bgg_id_and_type  (bgg_id,type) UNIQUE
#

class BggFamily < BggLink
end
