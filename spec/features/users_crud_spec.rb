require 'rails_helper'

describe 'the users crud process', type: :feature do
  let!(:user) { create(:user) }

  before :each { sign_in user }

  it 'can visit users index page' do
    visit '/users'
    within('table') do
      expect(page).to have_content user.name
      expect(page).to have_content user.email
    end
  end

  it 'can visit users show page' do
    visit '/users'
    within('table') do
      click_link 'Show'
    end
    expect(page).to have_content user.name
    expect(page).to have_content user.email
  end
end
