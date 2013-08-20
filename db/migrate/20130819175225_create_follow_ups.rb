class CreateFollowUps < ActiveRecord::Migration
  def change
    create_table :follow_ups do |t|
      t.string :task
      t.boolean :completed, default: false
      t.integer :assigned_user
      t.references :user
      t.references :note

      t.timestamps
    end
  end
end
