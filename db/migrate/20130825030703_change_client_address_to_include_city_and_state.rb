class ChangeClientAddressToIncludeCityAndState < ActiveRecord::Migration
  def change
    add_column :clients, :street,  :string 
    add_column :clients, :city, :string 
    add_column :clients, :provence, :string 
    remove_column :clients, :address
  end
end
