class AddOrderIdToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :order_id, :integer
  end
end
