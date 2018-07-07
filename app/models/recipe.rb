class Recipe < ApplicationRecord
  belongs_to :cuisine
  validates :title, :difficulty, :cook_time, :ingredients, :cook_method, presence: true
  belongs_to :recipe_type
  has_attached_file :photo
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
