class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :creator_id
      t.integer :musician_id
      t.text :content

      t.timestamps
    end
  end
end
