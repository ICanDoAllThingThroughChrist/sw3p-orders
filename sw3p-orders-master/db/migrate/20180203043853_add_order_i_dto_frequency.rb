class AddOrderIDtoFrequency < ActiveRecord::Migration[5.1]
  def change
    add_column :frequencies, :order_id, :integer
  end
end
