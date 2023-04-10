class AddFieldstoUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :fathername, :string
    add_column :users, :gender, :integer
    add_column :users, :dob, :date
    add_column :users, :cnic, :string
    add_column :users, :nationality, :string
    add_column :users, :contact, :string
    add_column :users, :exam, :string
  end
end
