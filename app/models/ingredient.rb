class Ingredient < ApplicationRecord

  has_many :doses
  has_many :cocktails, through: :doses

  # validates
  validates :name, presence: true, uniqueness: true

end
