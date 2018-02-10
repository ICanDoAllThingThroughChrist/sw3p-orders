class CreateOrderFrequencies < ActiveRecord::Migration[5.1]
  def change
    create_table :order_frequencies do |t|
      t.integer :order_id 
      t.integer :frequencie_id
    end
  end
end
