class CreateRecruitmentPostscripts < ActiveRecord::Migration[5.2]
  def change
    create_table :recruitment_postscripts do |t|
      t.text :postscript, null: false, limit: 2000
      # t.integer :musician_id, null: false
      # t.integer :recruitment_id, null: false
      t.references :musician, foreign_key: true
      t.references :recruitment, foreign_key: true

      t.timestamps
    end
    # add_foreign_key :recruitment_postscripts, :musicians
    # add_foreign_key :recruitment_postscripts, :recruitments
  end
end
