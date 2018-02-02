class RenameDeadline < ActiveRecord::Migration[5.1]
  def change
    rename_column :deadlines, :deadlines, :deadline
  end
end
