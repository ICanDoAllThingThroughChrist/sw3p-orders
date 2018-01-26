class CreateOrdersComments < ActiveRecord::Migration[5.1]
  def change
    create_table :orders_comments do |t|
      t.integer :order_id 
      t.integer :comment_id
    end
  end
end
