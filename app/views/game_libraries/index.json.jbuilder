json.array!(@game_libraries) do |game_library|
  json.extract! game_library, :id, :librarian_id
  json.url game_library_url(game_library, format: :json)
end
