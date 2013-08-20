class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :hcn
      t.string :physician
      t.string :physician_phone
      t.text :diagnosis
      t.text :advanced_directives
      t.string :address
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_relationship

      t.timestamps
    end
  end
end
