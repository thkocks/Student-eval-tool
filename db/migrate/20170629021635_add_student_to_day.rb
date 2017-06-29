class AddStudentToDay < ActiveRecord::Migration[5.1]
  def change
    add_reference :days, :student, foreign_key: true
  end
end
