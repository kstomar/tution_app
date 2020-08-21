class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.text :content
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.integer :length_of_students

      t.timestamps
    end
  end
end
