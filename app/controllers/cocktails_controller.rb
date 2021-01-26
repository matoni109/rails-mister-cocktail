class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = Dose.where(cocktail_id: params[:id])
    # @ingredient = ""

  end
  #CREATE
  def new
    @cocktail = Cocktail.new # needed to instantiate the form_for
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    # raise
    if @cocktail.save
      # no need for app/views/cocktails/create.html.erb
      redirect_to cocktail_path(@cocktail) # cocktails ( pural will take u to All )
    else
      render :new
    end
  end

  # UPDATE
  def edit
    @cocktails = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      # no need for app/views/cocktails/update.html.erb
      redirect_to cocktail_path(@cocktail)
    else
      render :edit
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    # no need for app/views/cocktails/destroy.html.erb
    redirect_to cocktails_path
  end
  private

  def has_doses?
    @cocktail.dose_ids.last = nil
    return '<%= link_to "Add Dose", new_cocktail_dose_path(@cocktail) , class: "btn card-link " %>'
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :ingredient, :photo, :image_scr)
    # params.require(:dose).permit(:ingredient)
  end

  def find_cocktail_params
    @cocktail = Cocktail.find(params[:id])
  end


end
