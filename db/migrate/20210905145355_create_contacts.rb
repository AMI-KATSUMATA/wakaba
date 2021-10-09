class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      # t.integer :creator_id
      # t.integer :musician_id
      t.references :creator, foreign_key: true
      t.references :musician, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
    # add_foreign_key :contacts, :creators
    # add_foreign_key :contacts, :musicians
  end
end
