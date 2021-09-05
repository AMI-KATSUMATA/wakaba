class AddColumnsToCreators < ActiveRecord::Migration[5.2]
  def change
    add_column :creators, :last_name, :string
    add_column :creators, :first_name, :string
    add_column :creators, :last_name_kana, :string
    add_column :creators, :first_name_kana, :string
    add_column :creators, :nickname, :string
    add_column :creators, :phone_number, :string
    add_column :creators, :schedule, :text
    add_column :creators, :price, :text
    add_column :creators, :image_id, :string
    add_column :creators, :introduction, :text
    add_column :creators, :is_deleted, :boolean
  end
end
