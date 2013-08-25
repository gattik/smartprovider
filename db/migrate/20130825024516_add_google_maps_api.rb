class AddGoogleMapsApi < ActiveRecord::Migration
  def change
    add_column :clients, :latitude,  :float #you can change the name, see wiki
    add_column :clients, :longitude, :float #you can change the name, see wiki
    add_column :clients, :gmaps, :boolean #not mandatory, see wiki
  end
end
