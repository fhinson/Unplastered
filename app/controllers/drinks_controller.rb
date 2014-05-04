class DrinksController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  require 'twilio-ruby'

  def new
    @drink = Drink.new
  end

  def create
    @drink = current_user.drinks.build(drink_params)
    @user = current_user
    account_sid = 'ACf790f48ac9a0c4a1cb5e5548945e0889'
    auth_token = '8be80276be5dd74cf822b080068b1fd4'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    respond_to do |format|
      if @drink.save
        format.html { redirect_to "/"}
        bac = calculate_bac(@user)
        if (bac >= 0.1)
          @client.account.messages.create(
            :from => '+17328100203',
            :to => @user.friendnumber,
            :body => "Your friend #{@user.name} has a BAC of #{bac.round(4)}. Please go check up to see if he/she is ok."
          )
        end
      else
        format.html { render :new }
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def drink_params
      params.require(:drink).permit(:alcohol, :amount, :hunger, :mood, :user_id)
    end

end
