class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.references :creator, foreign_key: true
      t.references :musician, foreign_key: true
      t.text :content, null: false

      t.timestamps
    end
  end
end
