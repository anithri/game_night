json.array!(@game_sessions) do |game_session|
  json.extract! game_session, :id, :session_date, :location, :notes
  json.url game_session_url(game_session, format: :json)
end
