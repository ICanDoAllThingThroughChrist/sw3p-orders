class CreateCommentsOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :comments_orders, :id => false do |t|
      t.column :order_id, :int
      t.column :comment_id, :int
    end
  end
end
