# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file .env file.

player_account = PlayerAccount.create(confirmed_at: Date.today,
                                      email:        "#{ENV['PLAYER_ACCOUNT_SEED_EMAIL']}",
                                      password:     "#{ENV['PLAYER_ACCOUNT_SEED_PASSWORD']}")
group          = GamingGroup.create(name:        'Example Group',
                                    description: 'just a bunch of hoopy froods who like to game.',
)
group.group_members.create(player: player_account.player, role: :owner)
