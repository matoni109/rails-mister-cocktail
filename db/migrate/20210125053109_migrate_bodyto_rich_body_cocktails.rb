class MigrateBodytoRichBodyCocktails < ActiveRecord::Migration[6.0]
  def up
    Cocktail.find_each do |cocktail|
      cocktail.update(rich_body: cocktail.description)
    end
  end

  def down
    Cocktail.find_each do |cocktail|
      cocktail.update(body: cocktail.rich_body)
      cocktail.update(rich_body: nil)
    end
  end
end
