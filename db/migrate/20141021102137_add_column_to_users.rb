class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :cnic, :string
    add_column :users, :address, :string
  end
end
