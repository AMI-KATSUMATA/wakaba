class RemoveImageIdFromCreators < ActiveRecord::Migration[5.2]
  def change
    remove_column :creators, :image_id, :string
  end
end
