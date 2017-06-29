class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.datetime :date
      t.integer :eval

      t.timestamps
    end
  end
end
