namespace :export do
  namespace :tracks do
    desc "Export tracks with event equal to task_closed, you can set the filename with FILENAME=/path/to/file"
    task task_closed: :environment do
      puts 'Start exporting'

      if ENV['FILENAME'].present?
        ExportTracks.call(:task_closed, ENV['FILENAME'])
      else
        ExportTracks.call(:task_closed)
      end

      puts 'Exported with success!'
    end
  end
end
