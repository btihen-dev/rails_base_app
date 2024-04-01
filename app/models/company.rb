class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy
  has_many :person_jobs, through: :jobs
  has_many :people, through: :person_jobs

  normalizes :name,  with: ->(value) { value.strip }

  validates :name, presence: true
  validates :name, uniqueness: true
end
