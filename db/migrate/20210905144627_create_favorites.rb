class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :creator_id
      t.integer :musician_id 
      t.string :subject

      t.timestamps
    end
  end
end
