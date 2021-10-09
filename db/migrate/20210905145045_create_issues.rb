class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.references :recruitment, foreign_key: true
      t.references :creator, foreign_key: true
      t.references :musician, foreign_key: true
      t.integer :status, null: false, default: "0"

      t.timestamps
    end
  end
end
