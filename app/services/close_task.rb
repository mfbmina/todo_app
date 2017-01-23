module CloseTask
  def self.call(task)
    return false if task.blank?
    update_task(task)
    Track.create(track_params(task))
    TaskMailer.close(task).deliver_now
    true
  end

  private

  def self.update_task(task)
    task.email_color = Task.email_colors.values.sample
    task.email_congratulations = Task.email_congratulations.values.sample
    task.closed = true
    task.closed_at = DateTime.now
    task.save
  end

  def self.track_params(task)
    {
      event: :task_closed,
      data: {
        user_email: task.user.email,
        task: {
          email_color: task.color_in_hex,
          email_congratulations: task.congratulations_message,
          closed_at: task.closed_at
        }
      }
    }
  end
end
