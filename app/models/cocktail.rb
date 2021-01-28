class Cocktail < ApplicationRecord
  has_rich_text :rich_body

  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses, dependent: :destroy

  ## Validations
  validates :name, presence: true, uniqueness: true

  has_one_attached :photo

  accepts_nested_attributes_for :ingredients, :doses


  # def dose_description=(description)
  #   @dose.description = description
  # end

  # def dose_description
  #   @dose.description
  # end
end
