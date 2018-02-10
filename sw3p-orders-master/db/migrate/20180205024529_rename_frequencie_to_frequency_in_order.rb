class RenameFrequencieToFrequencyInOrder < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :frequencie, :frequency
  end
end
