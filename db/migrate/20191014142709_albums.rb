class Albums < ActiveRecord::Migration[5.2]
  def change
    add_column :albums, :user_id, :integer
    add_foreign_key "albums", "users", on_delete: :cascade
  end
end
