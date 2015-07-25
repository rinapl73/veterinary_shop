class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :address, :text
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :school_name, :string
    add_column :users, :years_in_practice, :integer
    add_column :users, :role, :integer
  end
end
