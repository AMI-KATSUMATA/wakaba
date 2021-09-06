class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.boolean :checked
      t.string :action
      t.boolean :is_musician

      t.timestamps
    end
  end
end
