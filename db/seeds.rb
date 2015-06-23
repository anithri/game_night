# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.
require 'ffaker'
player_account = PlayerAccount.create(confirmed_at: Date.today,
                                      email:        "#{ENV['PLAYER_ACCOUNT_SEED_EMAIL']}",
                                      password:     "#{ENV['PLAYER_ACCOUNT_SEED_PASSWORD']}")
player_account.player.update(name: 'Scott M Parrish')

50.times do
  pa = PlayerAccount.create(confirmed_at: Date.today,
                            email:        FFaker::Internet.email,
                            password:     FFaker::Internet.password)
  pa.player.update(name: FFaker::Name.name)

end

[
    175155, 125153, 166384, 169427, 171623, 107529, 164775, 178550, 179572, 164153,
    123045, 176564, 150376, 176189, 162591, 163354, 169794, 124742, 163968, 132531,
    148228, 96848, 163745, 150010, 12333, 154203, 102794, 132817, 157809, 84876,
    68820, 177352, 110327, 146021, 77423, 146439, 147020, 39938, 155624, 121921,
    130486, 174785, 175621, 72125, 103885, 68448, 115746, 155068, 120677,
    138161, 132531, 28143, 148228, 154203, 161417, 2338, 164153, 110327, 72125
]
.each do |bgg_id|
  WithBggApi::FindSummarizeImportById.call(cache: Rails.cache, bgg_id: bgg_id)
end
games = GameSummary.all.to_a
GameLibrary.all.to_a.each do |gl|
  gl.game_summaries = games.sample(5 + rand(20))
  gl.save

end


