class CreateRecruitmentPostscripts < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitment_postscripts do |t|
      t.text :postscript
      t.integer :musician_id
      t.integer :recruitment_id

      t.timestamps
    end
  end
end
