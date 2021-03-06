class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :ingredients, dependent: :destroy
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  # Even though I'm now using a nested form object with Reform I still haven't
  # found a clean way to update my nested ingredients when updating a recipe.
  # Manually running update after the form object has run it's validations allows
  # for nested ingredients to be destroyed if the accepts_nested_attributes_for
  # method is call on :ingredients with allow_destroy set to true.
  accepts_nested_attributes_for :ingredients, allow_destroy: true

  scope :recent_restricted, ->{ where(private: false).order('created_at DESC').limit(5) }
  scope :recent_all, ->{ all.order('created_at DESC').limit(5) }
end
