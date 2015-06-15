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

group = GamingGroup.create(name:        'Friends who game',
                           description: 'just a bunch of hoopy froods who like to game.',
                           shared_with: GamingGroup.shared_withs.keys.sample
)

group.group_members.create(player: player_account.player, role: :owner)

all_groups = [group]

10.times do
  all_groups << GamingGroup.create(name:        FFaker::Company.name,
                                   description: FFaker::BaconIpsum.phrase,
                                   shared_with: GamingGroup.shared_withs.keys.sample
  )

end

50.times do
  pa = PlayerAccount.create(confirmed_at: Date.today,
                            email:        FFaker::Internet.email,
                            password:     FFaker::Internet.password)
  pa.player.update(name: FFaker::Name.name)

  all_groups.sample(rand(3) + 1).each do |group|
    group.group_members.create(player: pa.player, role: GroupMember.roles.keys[1..-1].sample)
  end
end
all_groups.sample(rand(5) + 1).each do |group|
  group.group_members.create(player: player_account.player, role: GroupMember.roles.keys[1..-1].sample)
end

all_groups.each do |group|
  sessions = 5 + rand(6)
  sessions.times do
    date = rand(90).days.ago
    group.game_sessions.build(game_date: date,
                               location:  FFaker::Education.school,
                               log:       FFaker::BaconIpsum.phrase
    )
  end
  group.save
end

[138161, 132531, 28143, 148228, 154203, 161417, 2338, 164153, 110327, 72125].each do |bgg_id|
  bgg_game = WithBggApi::ImportById.call(cache: Rails.cache, bgg_id: bgg_id).new_game

  WithBggApi::SummarizeGame.call(bgg_game: bgg_game).game_summary.save
end


