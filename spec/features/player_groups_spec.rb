require 'rails_helper'

RSpec.feature "PlayerGroups", type: :feature do

  scenario 'player_groups' do
    visit root_path
    expect(page).to have_content('Welcome')
  end

end
