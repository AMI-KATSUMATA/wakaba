class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.integer :creator_id, null: false
      t.text :description, limit: 1000
      t.boolean :is_private, null: false, default: "false"

      t.timestamps
    end
    add_foreign_key :artworks, :creators
  end
end
