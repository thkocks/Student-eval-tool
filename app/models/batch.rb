class Batch < ApplicationRecord
  has_many :students, dependent: :destroy

  validates :number, presence: true, uniqueness: true
  validates :start_date, presence: true, uniqueness: true
  validates :end_date, presence: true, uniqueness: true

  scope :order_by_id, -> { order(:id) }

  def get_student
		students_array = []
		students.each do |student|
			student.evaluations.each do |evaluation|
				students_array += [student] if evaluation.color == 1
				students_array += [student, student] if evaluation.color == 2
				students_array += [student, student, student] if evaluation.color == 3
			end
		end
		students_array.sample
	end

  def percentages
  colors = []
  students.each do |student|
    student.evaluations.each do |evaluation|
      colors << evaluation.color
    end
  end
  {
    green: (colors.count(3) * 100) / colors.size ,
    yellow: (colors.count(2) * 100) / colors.size,
    red: (colors.count(1) * 100) / colors.size
  }
  end
end
