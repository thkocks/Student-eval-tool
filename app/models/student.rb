class Student < ApplicationRecord
  belongs_to :batch
  has_many :days, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :photo, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
