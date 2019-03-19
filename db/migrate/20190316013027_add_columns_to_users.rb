class AddColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :image, :string
    add_column :users, :type, :string
    add_column :users, :description, :string
    add_column :users, :status, :string
  end
end
