class DosesController < ApplicationController
  def new
    # we need @cocktail in our `simple_form_for`
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    # raise
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.where(cocktail_id: params[:id])

  end

  def create
    @dose = Dose.new(dose_params)
    # we need `restaurant_id` to associate dose with corresponding restaurant
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if  @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
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
