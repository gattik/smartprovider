class RenameProvenceToProvince < ActiveRecord::Migration
  def change
    rename_column :clients, :provence, :province
  end
end
