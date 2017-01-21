require 'rails_helper'

describe 'the sign in process', type: :feature do
  let!(:user) { create(:user) }

  it 'signs me in' do
    visit '/users/sign_in'
    within('form#new_user') do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: '12345678'
    end

    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully.'
  end
end
