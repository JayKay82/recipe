class Recipe < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { in: 2..20 }
  validates :description, presence: true, length: { maximum: 140 }
  validates :cooking_steps, presence: true
  validates :prep_time, presence: true, numericality: { only_integer: true }
  validates :cooking_time, presence: true, numericality: { only_integer: true }
end
