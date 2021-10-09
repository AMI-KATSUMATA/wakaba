class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_creator_id
      t.integer :visited_creator_id
      t.integer :visitor_musician_id
      t.integer :visited_musician_id
      # t.integer :message_id
      # t.integer :issue_id
      # t.integer :entry_id
      t.references :message, foreign_key: true
      t.references :issue, foreign_key: true
      t.references :entry, foreign_key: true
      t.boolean :checked, null: false, default: "false"
      t.string :action, null: false
      t.boolean :is_musician, null: false, default: "false"

      t.timestamps
    end
    # add_foreign_key :notifications, :creators
    # add_foreign_key :notifications, :musicians
    # add_foreign_key :notifications, :messages
    # add_foreign_key :notifications, :issues
    # add_foreign_key :notifications, :entries
  end
end
