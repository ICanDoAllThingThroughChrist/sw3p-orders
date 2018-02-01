class AddColumnsToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :site, :string
    add_column :orders, :task, :string
    add_column :orders, :deadline, :string 
    add_column :orders, :frequency, :string 
    add_column :orders, :comments, :string 
    add_column :orders, :firstupdate, :datetime
    add_column :orders, :firstupdatecomment, :string
  end
end
