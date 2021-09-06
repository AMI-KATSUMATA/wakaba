class RemoveImageIdFromMusicians < ActiveRecord::Migration[5.2]
  def change
    remove_column :musicians, :image_id, :string
  end
end
