class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :creator, foreign_key: true
      t.references :recruitment, foreign_key: true

      t.timestamps
    end
  end
end
