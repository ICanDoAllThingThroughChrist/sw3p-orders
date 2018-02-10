class CreateOrderStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :order_statuses do |t|
      t.integer :order_id 
      t.integer :statuse_id
    end
  end
end
