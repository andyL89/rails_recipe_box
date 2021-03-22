class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :tags
  validates :title, presence: true, uniqueness: true
  before_save(:titleize_recipe)

  scope :search, -> (title_parameter) { where('LOWER(title) LIKE ?', "%#{title_parameter.downcase}%") }

  private
    def titleize_recipe
      self.title = self.title.titleize
    end
end