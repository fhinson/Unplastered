class DrinksController < ApplicationController
  before_action :authenticate_user!
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


end
