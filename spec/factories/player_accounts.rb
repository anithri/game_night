require 'ffaker'
FactoryGirl.define do
  factory :player_account do
    email {FFaker::Internet.email}
    password {FFaker::Internet.password}

  end

end
