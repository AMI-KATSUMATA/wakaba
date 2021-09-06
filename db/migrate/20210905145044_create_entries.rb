class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :creator_id
      t.integer :recruitment_id

      t.timestamps
    end
  end
end
