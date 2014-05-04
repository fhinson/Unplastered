class ChangeAmountInDrinks < ActiveRecord::Migration
  def change
   change_column :drinks, :amount, :float
  end
end
