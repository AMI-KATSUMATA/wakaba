class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :message_id
      t.integer :issue_id
      t.integer :entry_id
      t.boolean :checked, null: false, default: "false"
      t.string :action
      t.boolean :is_musician, null: false, default: "false"

      t.timestamps
    end
  end
end
