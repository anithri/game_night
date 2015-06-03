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
player_account.player.update(name: FFaker::Name.name)

group = GamingGroup.create(name:        'Example Group',
                           description: 'just a bunch of hoopy froods who like to game.',
)

group.group_members.create(player: player_account.player, role: :owner)

10.times do
  pa             = PlayerAccount.create(confirmed_at: Date.today,
                                        email:        FFaker::Internet.email,
                                        password:     FFaker::Internet.password)
  pa.player.name = FFaker::Name.name
  group.group_members.create(player: pa.player, role: GroupMember.roles.keys[1..-2].sample)

end
