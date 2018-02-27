class CreateJoinTableOrderAttachment < ActiveRecord::Migration[5.1]
  def change
    create_join_table :orders, :attachments do |t|
      t.integer :order_id
      t.integer :attachment_id
    end
  end
end
