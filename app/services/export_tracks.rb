require 'csv'

module ExportTracks
  def self.call(event_type = nil, filename = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}.csv")
    CSV.open(filename, "wb") do |csv|
      csv << ["user", "color", "congratulations message", "closed at"]
      Track.all.each do |track|
        csv << track.to_report
      end
    end
  end
end
