class RenameStatuseIdinOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :statuse_id, :status_id
    add_column :orders, :status, :string
    end
end
