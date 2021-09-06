class AddColumnsToMusicians < ActiveRecord::Migration[5.2]
  def change
    add_column :musicians, :last_name, :string
    add_column :musicians, :first_name, :string
    add_column :musicians, :last_name_kana, :string
    add_column :musicians, :first_name_kana, :string
    add_column :musicians, :nickname, :string
    add_column :musicians, :phone_number, :string
    add_column :musicians, :image_id, :string
    add_column :musicians, :introduction, :text
    add_column :musicians, :is_deleted, :boolean
  end
end
