require 'rails_helper'

describe 'the sign out process', type: :feature do
  let!(:user) { create(:user) }

  it 'signs me out' do
    visit '/users/sign_in'
    within('form#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '12345678'
    end

    click_button 'Log in'
    click_link 'Logout'
    expect(page).to have_content 'Log in'
  end
end
