class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.references :user
      t.references :client

      t.timestamps
    end
  end
end
