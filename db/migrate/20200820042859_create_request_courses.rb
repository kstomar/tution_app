class CreateRequestCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :request_courses do |t|
      t.references :user
      t.references :course
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
