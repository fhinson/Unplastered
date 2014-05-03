class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :alcohol
      t.integer :amount
      t.integer :hunger
      t.string :mood

      t.timestamps
    end
  end
end
