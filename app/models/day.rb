class Day < ApplicationRecord
  has_many :remarks, dependent: :destroy

  validates :date, presence: true
end
