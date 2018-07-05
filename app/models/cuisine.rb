class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: {message: 'Você deve informar o nome da cozinha'}
  validates :name, uniqueness: {message: 'Cozinha Duplicada'}
end
