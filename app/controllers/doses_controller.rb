class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    # look for the cocktail that has been passed in the view (new doses)
    @cocktail = Cocktail.find(params[:cocktail_id])
    # Cocktail ID
    @dose.cocktail = @cocktail
    # needs an if statement to actually save
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    # @cocktail = Cocktail.find(params[:cocktail_id])
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
