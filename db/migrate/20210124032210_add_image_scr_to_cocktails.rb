class AddImageScrToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :image_scr, :string
  end
end