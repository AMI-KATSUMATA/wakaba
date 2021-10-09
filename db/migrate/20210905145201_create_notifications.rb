class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_creator_id
      t.integer :visited_creator_id
      t.integer :visitor_musician_id
      t.integer :visited_musician_id
      t.references :message, foreign_key: true
      t.references :issue, foreign_key: true
      t.references :entry, foreign_key: true
      t.boolean :checked, null: false, default: "false"
      t.string :action, null: false
      t.boolean :is_musician, null: false, default: "false"

      t.timestamps
    end
  end
end
