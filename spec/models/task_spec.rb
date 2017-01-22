require 'rails_helper'

describe Task, type: :model do
  let(:task) { build(:task) }

  describe '#color_in_hex' do
    it 'should return an color for each key on email_colors' do
      Task.email_colors.keys do |key|
        task.email_color = key
        expect(task.color_in_hex).to include(Task::EMAIL_COLORS_HEX)
      end
    end
  end

  describe '#congratulations_message' do
    it 'should return an color for each key on email_colors' do
      Task.email_congratulations.keys do |key|
        task.email_congratulations = key
        expect(task.congratulations_message).to include(Task::EMAIL_CONGRATZ_MSG)
      end
    end
  end
end
