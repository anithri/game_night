require 'rails_helper'

feature 'signing in' do
  let(:player_account){FactoryGirl.create(:player_account)}

  def fill_in_signin_fields
    fill_in "player_account[email]", with: player_account.email
    fill_in "player_account[password]", with: player_account.password
    click_button 'Sign in'
  end

  scenario 'visiting the site to sign in' do
    visit root_path
    click_link 'Sign in'
    fill_in_signin_fields
    expect(page).to have_content('Welcome to Game Night')
  end

end
