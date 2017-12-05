class Allergen < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 2, maximum: 35 }
  has_many :recipe_allergens
  has_many :recipes, through: :recipe_allergens
end