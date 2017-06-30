class Batch < ApplicationRecord
  has_many :students, dependent: :destroy

  validates :number, presence: true, uniqueness: true
  validates :start_date, presence: true, uniqueness: true
  validates :end_date, presence: true, uniqueness: true

  scope :order_by_id, -> { order(:id) }
end
