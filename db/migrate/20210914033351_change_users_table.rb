class ChangeUsersTable < ActiveRecord::Migration[5.2]
  def change
    execute 'DELETE FROM users;'
    remove_column :users, :name

    add_column :users, :email, :string, null: false, unique: true
  end
end
