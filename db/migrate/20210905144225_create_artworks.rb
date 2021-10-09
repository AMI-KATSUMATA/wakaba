class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.references :creator, foreign_key: true
      t.text :description, limit: 1000
      t.boolean :is_private, null: false, default: "false"

      t.timestamps
    end
  end
end
