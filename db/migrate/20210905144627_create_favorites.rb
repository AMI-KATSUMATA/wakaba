class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      # t.integer :creator_id, null: false
      # t.integer :musician_id
      # t.integer :recruitment_id
      t.references :creator, foreign_key: true
      t.references :musician, foreign_key: true
      t.references :recruitment, foreign_key: true
      t.string :subject, null: false

      t.timestamps
    end
    # add_foreign_key :favorites, :creators
    # add_foreign_key :favorites, :musicians
  end
end
