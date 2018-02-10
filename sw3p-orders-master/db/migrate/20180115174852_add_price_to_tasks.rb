class AddPriceToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :price, :integer
    add_column :tasks, :inventory, :integer
  end
end
