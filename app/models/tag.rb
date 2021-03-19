class Tag < ApplicationRecord
  has_and_belongs_to_many :recipes
  validates :category, uniqueness: true
  before_save(:titleize_recipe)

  private
    def titleize_recipe
      self.category = self.category.titleize
    end
end