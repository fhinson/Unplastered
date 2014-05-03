class UsersController < ApplicationController
  include ApplicationHelper

  def refresh
    @user = User.find(params[:id])
    render json:[calculate_bac(@user)]
  end
end
