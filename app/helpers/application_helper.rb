module ApplicationHelper
  def calculate_bac(user)
    body_water_constant = user.sex == "male" ? 0.58 : 0.49
    weight = user.weight
    drinks = !user.drinks.any? ? 0 : (user.drinks.pluck(:amount).compact.inject(:+))/0.6
    metabolism_constant = 0.017
    drinking_period = !user.drinks.any? ? 0 : ((Time.now - user.drinks.first.created_at) / 3600)
    bac = ((0.806 * drinks * 1.2)/(body_water_constant * weight)) - (metabolism_constant * drinking_period)
    return bac > 0 ? bac : 0
  end

  def calculate_pi(user)
    drink = user.drinks.last
    body_water_constant = user.sex == "male" ? 0.58 : 0.49
    weight = user.weight * 3
    hunger = drink.hunger * 5
    bac = calculate_bac(user)
    experience = 5
    pi = (1000 * bac * hunger) / ((body_water_constant*weight) + experience)
    return pi
  end
end
