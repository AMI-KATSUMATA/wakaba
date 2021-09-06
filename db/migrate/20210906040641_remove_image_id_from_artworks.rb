class RemoveImageIdFromArtworks < ActiveRecord::Migration[5.2]
  def change
    remove_column :artworks, :image_id, :string
  end
end
