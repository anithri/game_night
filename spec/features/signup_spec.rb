require 'rails_helper'

feature 'signing in' do
  let(:player_account){FactoryGirl.build(:player_account)}

  def fill_in_signup_fields
    fill_in "player_account[email]", with: player_account.email
    fill_in "player_account[password]", with: player_account.password
    fill_in "player_account[password_confirmation]", with: player_account.password
    click_button 'Sign up'
  end

  scenario 'visiting the site to sign in' do
    visit root_path
    click_link 'Sign up'
    fill_in_signup_fields
    expect(page).to have_content('activate your account')

  end

end
