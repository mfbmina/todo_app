class TaskMailer < ApplicationMailer
  def close(task)
    @task = task
    @user = task.user
    mail(to: @user.email, subject: 'Task closed')
  end
end
