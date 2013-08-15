class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.string :importance
      t.references :user
      t.references :client

      t.timestamps
    end
  end
end
