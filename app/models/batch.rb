class Batch < ApplicationRecord
  has_many :students, dependent: :destroy

  validates :number, uniqueness: true
  validates :start_date, uniqueness: true
  validates :end_date, uniqueness: true

  scope :order_by_id, -> { order(:id) }
end
