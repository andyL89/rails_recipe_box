class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes
  validates :name, presence: true, uniqueness: true
  before_save(:titleize_ingredient)

  private
    def titleize_ingredient
      self.name = self.name.titleize
    end
end