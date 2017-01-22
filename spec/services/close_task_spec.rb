require 'rails_helper'

describe CloseTask do
  let(:task) { create(:task) }

  describe 'self.call' do
    it 'should return false if no args sended' do
      expect(CloseTask.call(nil)).to be_falsey
    end

    it 'should return true' do
      expect(CloseTask.call(task)).to be_truthy
    end

    it 'should set closed to true' do
      CloseTask.call(task)
      task.reload
      expect(task.closed).to be_truthy
    end

    it 'should set email_color' do
      CloseTask.call(task)
      task.reload
      expect(task.email_color).to_not be_nil
    end

    it 'should set email_congratulations' do
      CloseTask.call(task)
      task.reload
      expect(task.email_congratulations).to_not be_nil
    end

    it 'should sent an email' do
      expect { CloseTask.call(task) }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end
  end
end
