class CreateNews < ActiveRecord::Migration[7.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :description
      t.date :date
      t.string :location
      t.string :tags
      t.integer :status
      t.references :admin
      t.string :slug

      t.timestamps
    end
  end
end
