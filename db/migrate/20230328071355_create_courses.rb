class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.references :course_category
      t.string :description
      t.integer :price
      t.string :slug
      t.integer :status

      t.timestamps
    end
  end
end
