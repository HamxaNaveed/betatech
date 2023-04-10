class CreateCourseEnrollements < ActiveRecord::Migration[7.0]
  def change
    create_table :course_enrollements do |t|
      t.references :user
      t.references :course
      t.string :slug
      t.integer :status

      t.timestamps
    end
  end
end
