json.array!(@gaming_groups) do |gaming_group|
  json.extract! gaming_group, :id, :name, :description, :owner_id
  json.url gaming_group_url(gaming_group, format: :json)
end
