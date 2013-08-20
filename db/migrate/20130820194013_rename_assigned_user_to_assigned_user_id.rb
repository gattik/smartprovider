class RenameAssignedUserToAssignedUserId < ActiveRecord::Migration
  def change
    rename_column :follow_ups, :assigned_user, :assigned_user_id 
  end
end
