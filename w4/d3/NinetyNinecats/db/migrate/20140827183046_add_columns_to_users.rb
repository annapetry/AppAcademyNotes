class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_name, :string, null: false
    add_column :users, :password_digest, :string, null: false
    add_column :users, :session_token, :string,  null: false

    add_index(:users, :user_name, unique: true)
  end
end
