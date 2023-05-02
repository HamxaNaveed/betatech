class AlterCourseTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :description, :string
  end
end
