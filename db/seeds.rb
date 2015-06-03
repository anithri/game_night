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

group = GamingGroup.create(name:        'Example Group',
                           description: 'just a bunch of hoopy froods who like to game.',
)

group.group_members.create(player: player_account.player, role: :owner)

all_groups = [group]

4.times do
  all_groups << GamingGroup.create(name: FFaker::Company.name, description: FFaker::BaconIpsum.phrase)
end

20.times do
  pa = PlayerAccount.create(confirmed_at: Date.today,
                            email:        FFaker::Internet.email,
                            password:     FFaker::Internet.password)
  pa.player.update(name: FFaker::Name.name)

  all_groups.sample(rand(3) + 1).each do |group|
    group.group_members.create(player: pa.player, role: GroupMember.roles.keys[1..-1].sample)
  end
end
