class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.html { redirect_to "/"}
      else
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def drink_params
      params.require(:drink).permit(:alcohol, :amount, :hunger, :mood)
    end


end
