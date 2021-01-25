class Cocktail < ApplicationRecord
  has_rich_text :rich_body


  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy

  ## Validations
  validates :name, presence: true, uniqueness: true

end
