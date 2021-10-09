class CreateRecruitmentPostscripts < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitment_postscripts do |t|
      t.text :postscript, null: false, limit: 2000
      t.references :musician, foreign_key: true
      t.references :recruitment, foreign_key: true

      t.timestamps
    end
  end
end
