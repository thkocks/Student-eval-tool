class CreateBatches < ActiveRecord::Migration[5.1]
  def change
    create_table :batches do |t|
      t.integer :number
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
