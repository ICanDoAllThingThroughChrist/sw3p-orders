class CreateOrderTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :order_tasks do |t|
      t.integer :order_id 
      t.integer :task_id
    end
  end
end
