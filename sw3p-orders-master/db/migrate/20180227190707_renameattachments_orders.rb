class RenameattachmentsOrders < ActiveRecord::Migration[5.1]
  def change
    rename_table :attachments_orders, :orders_attachments 
  end
end
