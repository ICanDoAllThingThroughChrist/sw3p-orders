class CreateOrderDeadline < ActiveRecord::Migration[5.1]
  def change
    create_table :order_deadlines do |t|
      t.integer :order_id 
      t.integer :deadline_id
    end
  end
end
