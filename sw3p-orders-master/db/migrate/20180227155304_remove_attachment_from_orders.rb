class RemoveAttachmentFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :attachment, :string
  end
end
