json.array!(@bgg_mechanics) do |bgg_mechanic|
  json.extract! bgg_mechanic, :id
  json.url bgg_mechanic_url(bgg_mechanic, format: :json)
end
