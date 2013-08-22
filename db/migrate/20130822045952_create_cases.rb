class CreateCases < ActiveRecord::Migration
  def change
    create_table :cases do |t|
      t.references :user, index: true
      t.references :client, index: true

      t.timestamps
    end
  end
end
