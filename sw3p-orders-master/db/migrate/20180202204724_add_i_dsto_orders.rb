class AddIDstoOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :status_id, :integer
    add_column :orders, :deadline_id, :integer
    add_column :orders, :frequency_id, :integer
  end
end
