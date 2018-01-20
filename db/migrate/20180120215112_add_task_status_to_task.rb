class AddTaskStatusToTask < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :task_status, :boolean
  end
end
