class CreateCertificates < ActiveRecord::Migration[7.0]
  def change
    create_table :certificates do |t|
      t.references :user
      t.references :course
      t.string :certificate_number
      t.timestamps
    end
  end
end
