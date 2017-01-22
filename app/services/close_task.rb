module CloseTask
  def self.call(task)
    return false if task.blank?
    task.email_color = Task.email_colors.values.sample
    task.email_congratulations = Task.email_congratulations.values.sample
    task.closed = true
    task.save
    TaskMailer.close(task).deliver_now
    true
  end
end
