require 'rails_helper'

describe Task, type: :model do
  let(:track) do
    Track.new(event: 0, data: {
      user_email: "mfbmina@gmail.com",
      task: {
        email_color: "#00cc00",
        email_congratulations: "herzliche glückwünsche",
        closed_at: "2017-01-23T00:02:18.794Z"
      }
    })
  end

  describe '#to_report' do
    it 'should return an color for each key on email_colors' do
      expect(track.to_report).to eq(["mfbmina@gmail.com", "#00cc00", "herzliche glückwünsche", "2017-01-23T00:02:18.794Z"])
    end
  end
end
