class DosesController < ApplicationController
  def new
    # we need @cocktail in our `simple_form_for`

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    # raise
  end

  def create
    # @dose = Dose.new(dose_params)
    #  "dose"=>{"description"=>"1oz", "ingredient_id"=>["1", "2"]},
    # "commit"=>"Submit Dose",
    #{}"cocktail_id"=>"1"}
    # we need `restaurant_id` to associate dose with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
    ing_ids = params[:dose][:ingredient_id]

    ing_ids.each do |ing_id|
      # @ing = Ingredient.find(ing_id)

      @dose = Dose.new(
        description: (params[:dose][:description]),
        cocktail_id: (params[:cocktail_id]),
        ingredient_id: ing_id
      )
      # @dose.cocktail = @cocktail
      if @dose.valid?
        @dose.save
      else
        render :new
      end
    end
    redirect_to cocktail_path(@cocktail)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.where(cocktail_id: params[:id])

  end


  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end
  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description, :cocktail_id)
    # params.require(:ingredient).permit(:ingredient_id)
  end

end
