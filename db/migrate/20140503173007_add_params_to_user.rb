class AddParamsToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :weight, :integer
    add_column :users, :race, :string
    add_column :users, :sex, :string
    add_column :users, :name, :string
  end
end
