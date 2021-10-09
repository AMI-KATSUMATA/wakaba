class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :creator, foreign_key: true
      t.references :musician, foreign_key: true
      t.references :recruitment, foreign_key: true
      t.string :subject, null: false

      t.timestamps
    end
  end
end
