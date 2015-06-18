json.array!(@bgg_categories) do |bgg_category|
  json.extract! bgg_category, :id
  json.url bgg_category_url(bgg_category, format: :json)
end
