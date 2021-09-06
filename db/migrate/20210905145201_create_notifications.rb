class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id
      t.integer :visited_id
      t.integer :message_id
      t.integer :issue_id
      t.integer :entry_
      t.boolean :checked
      t.string :action
      t.boolean :is_musician

      t.timestamps
    end
  end
end
