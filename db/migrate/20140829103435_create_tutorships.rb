class CreateTutorships < ActiveRecord::Migration
  def change
    create_table :tutorships do |t|
      t.references :tutor, index: true
      t.references :student, index: true
      t.boolean :accepted
      t.boolean :created_by_student
      t.text :message
      t.references :subject, index: true

      t.timestamps
    end
  end
end
