class AddIndexToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_index :authors, [:first_name, :last_name]
  end
end
