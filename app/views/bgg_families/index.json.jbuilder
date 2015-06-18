json.array!(@bgg_families) do |bgg_family|
  json.extract! bgg_family, :id
  json.url bgg_family_url(bgg_family, format: :json)
end
