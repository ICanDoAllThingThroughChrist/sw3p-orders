class NewTableFrequency < ActiveRecord::Migration[5.1]
  def change 
      create_table :frequencys do |t|
      t.string :frequency
      t.timestamps
    end
  end
end
