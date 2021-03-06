require 'rails_helper'

describe 'the closing task process process', type: :feature, js: true do
  let!(:task) { create(:task) }

  before :each { sign_in task.user }

  it 'closes the task' do
    visit '/todo_lists'
    within('table') do
      click_link_or_button 'Show'
    end
    expect(page).to have_content 'false'
    click_link_or_button 'Close'
    expect(page).to have_content 'true'
    expect(page).to have_content find(".close_task", visible: false).value
  end
end
