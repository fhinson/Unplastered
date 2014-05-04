class BaseController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def history
    @user = current_user
    @drinks = @user.drinks
  end

  def drunktest

  end
end
