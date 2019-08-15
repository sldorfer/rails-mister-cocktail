class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  # Validation
  # A dose must have a description, a cocktail and an ingredient, and [cocktail, ingredient] pairings should be unique.
  validates :description, presence: true
  validates :cocktail, presence: true
  validates :ingredient, presence: true
  validates_uniqueness_of :cocktail_id, scope: :ingredient_id
end
