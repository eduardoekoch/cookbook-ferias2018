class Recipe < ApplicationRecord
  belongs_to :cuisine
  validates :title, :difficulty, :cook_time, :ingredients, :cook_method, presence: true
  belongs_to :recipe_type
end
