json.array!(game_summaries) do |game|
  json.extract! game, :id, :name, :bgg_id, :thumbnail_url, :image_url, :year_published, :max_players, :min_players, :playing_time, :description
  json.url game_url(game, format: :json)
end
