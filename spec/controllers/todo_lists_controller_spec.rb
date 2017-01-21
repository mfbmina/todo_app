require 'rails_helper'

describe TodoListsController, type: :controller do
  let(:user) { create(:user) }

  before :each { sign_in user }

  describe 'GET index' do
    let(:todo_list) { create(:todo_list, user: user) }

    it 'should render the template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'should assigns @users' do
      get :index
      expect(assigns(:todo_lists)).to eq([todo_list])
    end
  end

  describe 'GET show' do
    let(:todo_list) { create(:todo_list, user: user) }

    it 'should render the template' do
      get :show, params: { id: todo_list.id }
      expect(response).to render_template('show')
    end

    it 'should assigns @user' do
      get :show, params: { id: todo_list.id }
      expect(assigns(:todo_list)).to eq(todo_list)
    end
  end

  describe 'GET new' do
    it 'should render the template' do
      get :new
      expect(response).to render_template('new')
    end

    it 'should assigns @users' do
      get :new
      expect(assigns(:todo_list)).to be_a_new(TodoList)
    end
  end

  describe 'GET edit' do
    let(:todo_list) { create(:todo_list, user: user) }

    it 'should render the template' do
      get :edit, params: { id: todo_list.id }
      expect(response).to render_template('edit')
    end

    it 'should assigns @user' do
      get :edit, params: { id: todo_list.id }
      expect(assigns(:todo_list)).to eq(todo_list)
    end
  end

  describe 'POST create' do
    context 'when all params are valid' do
      before :each do
        params = { todo_list: attributes_for(:todo_list) }
        post :create, params: params
      end

      it "should create a new todo_list" do
        expect(assigns(:todo_list).persisted?).to be_truthy
      end

      it "redirects to show" do
        expect(response).to redirect_to(todo_list_path(assigns(:todo_list)))
      end
    end

    context 'when at least one param isnt valid' do
      before :each do
        params = { todo_list: attributes_for(:todo_list, name: '') }
        post :create, params: params
      end

      it "should create a new todo_list" do
        expect(assigns(:todo_list).persisted?).to be_falsey
      end

      it "re-renders the new template" do
        expect(response).to render_template("new")
      end
    end
  end

  describe 'PATCH update' do
    let(:todo_list) { create(:todo_list, user: user) }

    context 'when all params are valid' do
      before :each do
        params = { id: todo_list.id, todo_list: { name: 'jooo' } }
        patch :update, params: params
      end

      it "redirects to show" do
        expect(response).to redirect_to(todo_list_path(assigns(:todo_list)))
      end

      it "updates the attrbibutes" do
        expect(assigns(:todo_list).name).to eq('jooo')
      end
    end

    context 'when at least one param isnt valid' do
      before :each do
        params = { id: todo_list.id, todo_list: { name: '' } }
        patch :update, params: params
      end

      it "re-renders the new template" do
        expect(response).to render_template("edit")
      end

      it "updates the attrbibutes" do
        expect(todo_list.reload.name).to_not eq('')
      end
    end
  end

  describe 'DELETE destroy' do
    let(:todo_list) { create(:todo_list, user: user) }

    it "redirects to index" do
      delete :destroy, params: { id: todo_list.id }
      expect(response).to redirect_to(todo_lists_path)
    end
  end
end
