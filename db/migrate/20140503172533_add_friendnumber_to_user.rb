class AddFriendnumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :friendnumber, :string
  end
end
