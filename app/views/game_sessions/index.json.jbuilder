json.array!(@game_sessions) do |game_session|
  json.extract! game_session, :id, :game_date, :location, :log
  json.url game_session_url(game_session, format: :json)
end
