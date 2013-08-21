class CreateVitals < ActiveRecord::Migration
  def change
    create_table :vitals do |t|
      t.string :weight
      t.string :height
      t.string :systolic
      t.string :diastolic
      t.string :beats
      t.string :beats_location
      t.string :beats_condition
      t.string :blood_sugar
      t.string :bs_condition
      t.string :breaths
      t.string :breaths_condition
      t.string :breaths_description
      t.string :temperature
      t.references :user, index: true
      t.references :client, index: true

      t.timestamps
    end
  end
end
