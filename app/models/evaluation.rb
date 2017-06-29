class Evaluation < ApplicationRecord
  belongs_to :student

  validates :date, presence: true
end
