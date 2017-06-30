class Student < ApplicationRecord
  belongs_to :batch
  has_many :evaluations, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :photo, presence: true

  scope :order_by_first_name, -> { order(:first_name) }

  def name
    "#{first_name} #{last_name}"
  end
end
