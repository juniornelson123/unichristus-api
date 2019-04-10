class AddLeaderToGroupsUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :groups_users, :leader, :boolean
  end
end
