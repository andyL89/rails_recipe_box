class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :tags
  validates :title, presence: true
  before_save(:titleize_recipe)

  private
    def titleize_recipe
      self.title = self.title.titleize
    end
end