class Character < ApplicationRecord
  belongs_to :species

  has_many :person_jobs, dependent: :destroy, foreign_key: :person_id
  has_many :jobs, through: :person_jobs
  has_many :companies, through: :jobs

  normalizes :first_name, :nick_name, :last_name, :given_name,
             with: ->(value) { value.strip }

  validates :first_name,
            uniqueness: { scope: :last_name,
                          message: "first_name and last_name already exists" }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :species, presence: true
  validates :gender, presence: true
  validates :gender, inclusion: { in: %w[male female] }
end
