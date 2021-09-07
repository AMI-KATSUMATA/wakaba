class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.integer :musician_id
      t.string :title
      t.text :detail
      t.date :deadline
      t.integer :price
      t.boolean :is_closed, null: false, default: "false"
      t.boolean :is_private, null: false, default: "false"

      t.timestamps
    end
  end
end
