class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.integer :creator_id
      t.text :description
      t.boolean :is_private, null: false, default: "false"

      t.timestamps
    end
  end
end
