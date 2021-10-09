class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      # t.integer :recruitment_id, null: false
      # t.integer :creator_id, null: false
      # t.integer :musician_id, null: false
      t.references :recruitment, foreign_key: true
      t.references :creator, foreign_key: true
      t.references :musician, foreign_key: true
      t.integer :status, null: false, default: "0"

      t.timestamps
    end
    # add_foreign_key :issues, :recruitments
    # add_foreign_key :issues, :creators
    # add_foreign_key :issues, :musicians
  end
end
