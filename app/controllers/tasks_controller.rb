class TasksController < ApplicationController
  def close
    todo_list_ids = current_user.todo_lists.pluck(:id)
    task = Task.where(id: params[:id], todo_list_id: todo_list_ids).first
    if task && !task.closed && CloseTask.call(task)
      render json: task.to_json, status: :ok
    else
      render json: { message: 'Something went wrong' }, status: :failure
    end
  end
end
