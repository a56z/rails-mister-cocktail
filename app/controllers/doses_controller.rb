class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.find(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path(@cocktail.id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end
end



