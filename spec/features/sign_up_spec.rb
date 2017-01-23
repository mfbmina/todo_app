require 'rails_helper'

describe 'the sign up process', type: :feature do
  it 'signs me up' do
    visit '/users/sign_up'
    within('form#new_user') do
      fill_in 'Email', with: 'mfbmina2@gmail.com'
      fill_in 'Name', with: 'Matheus F B Mina'
      fill_in 'Password', with: '12345678'
      fill_in 'Password confirmation', with: '12345678'
    end

    click_link_or_button 'Sign up'
    expect(page).to have_content 'You have signed up successfully.'
  end
end
