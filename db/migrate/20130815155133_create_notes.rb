class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.text :description
      t.integer :client_id
      t.string :importance

      t.timestamps
    end
  end
end
