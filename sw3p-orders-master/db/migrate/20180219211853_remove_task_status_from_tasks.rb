class RemoveTaskStatusFromTasks < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :task_status
    add_column :tasks, :task_status, :string
  end
end
