class CreateWorkorders < ActiveRecord::Migration[5.1]
  def change
    create_table :workorders do |t|
      t.integer :task_id 
      t.integer :frequency_id 
      t.integer :deadline_id 
      t.integer :status_id 
      t.integer :site_id
      t.integer :user_id 
    end
  end
end
