class Ingredient < ApplicationRecord
  has_many :doses

  # Validations
  # An ingredient must have a unique name.
  validates :name, presence: true, uniqueness: true
end
