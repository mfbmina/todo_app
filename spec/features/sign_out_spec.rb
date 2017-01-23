require 'rails_helper'

describe 'the sign out process', type: :feature do
  let!(:user) { create(:user) }

  it 'signs me out' do
    visit '/users/sign_in'
    within('form#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '12345678'
    end

    click_link_or_button 'Sign in'
    click_link_or_button 'Sign out'
    expect(page).to have_content 'Sign in'
  end
end
