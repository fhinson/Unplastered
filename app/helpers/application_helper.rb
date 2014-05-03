module ApplicationHelper
  def calculate_bac(user)
    drink = user.drinks.last
    body_water_constant = user.sex == "male" ? 0.58 : 0.49
    weight = user.weight
    drinks = drink.amount/0.6
    metabolism_constant = 0.017
    drinking_period = (Time.now - drink.created_at) / 3600
    bac = ((0.806 * drinks * 1.2)/(body_water_constant * weight)) - (metabolism_constant * drinking_period)
    return bac
  end
end
