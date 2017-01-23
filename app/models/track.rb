class Track < ApplicationRecord
  validates :event, presence: true
  validates :data, presence: true

  enum event: { task_closed: 0 }

  def to_report
    data_task = data['task']
    [data['user_email'], data_task['email_color'], data_task['email_congratulations'], data_task['closed_at']]
  end
end
