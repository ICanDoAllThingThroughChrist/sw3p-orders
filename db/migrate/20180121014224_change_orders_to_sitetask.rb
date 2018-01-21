class ChangeOrdersToSitetask < ActiveRecord::Migration[5.1]
  def change
    rename_table :orders, :sitetasks
  end
end
