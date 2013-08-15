class RemoveClientIDfromNotes < ActiveRecord::Migration
  def change
  	remove_column :notes, :client_id, :integer
  end
end
