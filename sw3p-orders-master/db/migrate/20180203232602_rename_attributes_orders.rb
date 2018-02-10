class RenameAttributesOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :frequency_id, :frequencie_id 
    rename_column :orders, :status_id, :statuse_id
  end
end
