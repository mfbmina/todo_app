require 'rails_helper'

describe 'the closing task process process', type: :feature, js: true do
  let!(:task) { create(:task) }

  before :each { sign_in task.user }

  it 'closes the task' do
    visit '/todo_lists'
    within('table') do
      click_link 'Show'
    end
    expect(page).to have_content 'false'
    click_link 'Close'
    page.evaluate_script("window.location.reload()")
    expect(page).to have_content 'true'
  end
end
