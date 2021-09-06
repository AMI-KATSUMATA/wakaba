class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.integer :recruitment_id
      t.integer :creator_id
      t.integer :musician_
      t.integer :status

      t.timestamps
    end
  end
end
