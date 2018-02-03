class AddOrderIDtoDeadline < ActiveRecord::Migration[5.1]
  def change
    add_column :deadlines, :order_id, :integer
  end
end
