class RenameFrequencys < ActiveRecord::Migration[5.1]
  def change
    rename_table :frequencys, :frequencies
  end
end
