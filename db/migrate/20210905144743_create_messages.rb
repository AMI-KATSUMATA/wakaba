class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      # t.integer :creator_id
      # t.integer :musician_id
      # t.integer :issue_id, null: false
      t.references :creator, foreign_key: true
      t.references :musician, foreign_key: true
      t.references :issue, foreign_key: true
      t.text :content, limit: 5000

      t.timestamps
    end
    # add_foreign_key :messages, :creators
    # add_foreign_key :messages, :musicians
    # add_foreign_key :messages, :issues
  end
end
