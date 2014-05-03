class AddMixedToDrinks < ActiveRecord::Migration
  def change
    add_column :drinks, :mixed, :boolean
  end
end
