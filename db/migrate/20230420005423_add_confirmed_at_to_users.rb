class AddConfirmedAtToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirmed_at, :datetime
    add_index :users, :confirmed_at
    add_column :users, :confirmation_token, :string, unique: true, index: true
    add_column :users, :confirmation_sent_at, :datetime, index: true
    execute("UPDATE users SET confirmed_at = NOW()")
  end
end
