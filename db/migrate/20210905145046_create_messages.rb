class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :creator, foreign_key: true
      t.references :musician, foreign_key: true
      t.references :issue, foreign_key: true
      t.text :content, limit: 5000

      t.timestamps
    end
  end
end
