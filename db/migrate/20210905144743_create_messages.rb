class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :is_musician

      t.timestamps
    end
  end
end
