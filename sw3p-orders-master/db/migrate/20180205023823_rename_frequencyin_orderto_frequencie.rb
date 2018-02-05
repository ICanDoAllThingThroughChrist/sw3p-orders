class RenameFrequencyinOrdertoFrequencie < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :frequency, :frequencie 
  end
end
