class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :creator_id, null: false
      t.integer :recruitment_id, null: false

      t.timestamps
    end
    add_foreign_key :entries, :creators
    add_foreign_key :entries, :recruitments
  end
end
