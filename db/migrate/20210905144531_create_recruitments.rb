class CreateRecruitments < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitments do |t|
      t.references :musician, foreign_key: true
      t.string :title, null: false, limit: 200
      t.text :detail, null: false, limit: 2000
      t.date :deadline, null: false
      t.integer :price, null: false
      t.boolean :is_closed, null: false, default: "false"
      t.boolean :is_private, null: false, default: "false"

      t.timestamps
    end
  end
end
