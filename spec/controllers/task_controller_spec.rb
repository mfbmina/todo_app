require 'rails_helper'

describe TasksController, type: :controller do
  let(:task) { create(:task) }

  before :each { sign_in task.user }

  describe 'PATCH close' do
    it 'should return success' do
      patch :close, params: { id: task.id }
      expect(response).to have_http_status(200)
    end

    it 'should return error' do
      patch :close, params: { id: 0 }
      expect(response).to have_http_status(500)
    end
  end
end
