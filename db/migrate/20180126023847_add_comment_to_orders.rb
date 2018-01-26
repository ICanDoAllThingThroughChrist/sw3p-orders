class AddCommentToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :comment_id, :integer
  end
end
