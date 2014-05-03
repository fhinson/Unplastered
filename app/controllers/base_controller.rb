class BaseController < ApplicationController
  def index

  end

  def history
    @user = current_user
    @drinks = @user.drinks
  end
end
