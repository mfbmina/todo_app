require 'rails_helper'

describe UsersController, type: :controller do
  let(:user) { create(:user) }

  before :each { sign_in user }

  describe 'GET index' do
    it 'should render the template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'should assigns @users' do
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET show' do
    it 'should render the template' do
      get :show, params: { id: user.id }
      expect(response).to render_template('show')
    end

    it 'should assigns @user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
    end
  end
end
