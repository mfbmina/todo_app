require 'rails_helper'

describe 'viewing todo lists', type: :feature do
  let!(:user) { create(:user) }
  let!(:todo_list) { create(:todo_list, user: user) }
  let!(:todo_list2) { create(:todo_list) }

  before :each { sign_in user }

  it "can see the user's todo_lists" do
    visit '/todo_lists'
    within('table') do
      expect(page).to have_content todo_list.name
      expect(page).to_not have_content todo_list2.name
      click_link 'Show'
    end
    expect(page).to have_content todo_list.name
    expect(page).to_not have_content todo_list2.name
  end
end

describe 'creating a todo list', type: :feature, js: true do
  let!(:user) { create(:user) }

  before :each { sign_in user }

  it 'creates a new todo list and tasks' do
    visit '/todo_lists'
    click_link 'New Todo List'
    fill_in 'Name', with: 'example list'
    click_link 'add task'
    all("input[id$='_description']").each_with_index do |e, i|
      e.set "task #{i + 1}"
    end
    click_button 'Create Todo list'
    expect(page).to have_content 'Todo list was successfully created.'
    expect(page).to have_content 'task 1'
    expect(page).to have_content 'task 2'
  end

  it 'stays on new page when not filled correctly' do
    visit '/todo_lists'
    click_link 'New Todo List'
    click_button 'Create Todo list'
    expect(page).to_not have_content 'Todo list was successfully created.'
  end
end

describe 'editing a todo list', type: :feature, js: true do
  let!(:user) { create(:user) }
  let!(:todo_list) { create(:todo_list, user: user) }

  before :each do
    sign_in user
    create(:task, description: 'task 1', todo_list: todo_list)
  end

  it "edits a todo list and its tasks" do
    visit '/todo_lists'
    within('table') do
      click_link 'Edit'
    end
    fill_in 'Name', with: 'example list'
    fill_in 'todo_list_tasks_attributes_0_description', with: 'task 2'
    click_button 'Update Todo list'
    expect(page).to have_content 'Todo list was successfully updated.'
    expect(page).to_not have_content 'task 1'
    expect(page).to have_content 'task 2'
  end

  it "can remove tasks" do
    visit '/todo_lists'
    within('table') do
      click_link 'Edit'
    end
    fill_in 'Name', with: 'example list'
    click_link 'remove task'
    click_button 'Update Todo list'
    expect(page).to have_content 'Todo list was successfully updated.'
    expect(page).to_not have_content 'task 1'
  end

  it "stays on edit page when not filled correctly" do
    visit '/todo_lists'
    within('table') do
      click_link 'Edit'
    end
    fill_in 'Name', with: ''
    click_button 'Update Todo list'
    expect(page).to_not have_content 'Todo list was successfully updated.'
  end
end

describe 'destroying a todo list', type: :feature, js: true do
  let!(:user) { create(:user) }
  let!(:todo_list) { create(:todo_list, user: user) }

  before :each { sign_in user }

  it "destroys a todo list" do
    visit '/todo_lists'
    within('table') do
      page.accept_confirm { click_link "Destroy" }
    end
    expect(page).to have_content 'Todo list was successfully destroyed.'
  end
end
