class AddColumnstoTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :status_report, :string
    add_column :tasks, :deadline, :string
    add_column :tasks, :occurrence, :string
  end
end
