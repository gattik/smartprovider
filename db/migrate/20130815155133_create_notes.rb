class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.string :importance
      t.references :user, index: true
      t.references :client, index: true

      t.timestamps
    end
  end
end
