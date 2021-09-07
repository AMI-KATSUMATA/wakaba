class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :creator_id
      t.integer :musician_id
      t.integer :issue_id
      t.text :content
      t.boolean :is_musician, null: false, default: "false"

      t.timestamps
    end
  end
end
