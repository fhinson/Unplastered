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
    account_sid = 'INSERT SID HERE'
    auth_token = 'INSERT TOKEN HERE'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token

    respond_to do |format|
      if @drink.save
        format.html { redirect_to "/"}
        bac = calculate_bac(@user)
        if (bac >= 0.08)
          @client.account.messages.create(
            :from => '+17328100203',
            :to => @user.friendnumber,
            :body => "Your friend #{@user.name} has a BAC of #{bac.round(4)}. Please go check up to see if he/she is ok."
          )
          @client.account.calls.create(
            :from => '+17328100203',
            :to => @user.friendnumber,
            :url => 'http://twimlbin.com/external/99bf5b1163ad6ac5',
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
