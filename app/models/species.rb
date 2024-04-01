class Species < ApplicationRecord
  normalizes :kind, with: ->(value) { value.strip }

  validates :kind, presence: true
  validates :kind, uniqueness: true
end
