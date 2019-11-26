class AddUsernameLevelTotalPointToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    add_column :users, :level, :integer, default: 0
    add_column :users, :total_point, :integer,  default: 0
  end
end
