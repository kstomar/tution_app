ActiveAdmin.register Course do
  permit_params :title, :content, :start_datetime, :end_datetime, :length_of_students

  form do |f|
    f.inputs do
      f.input :title
      f.input :content
      f.input :start_datetime,  as: :date_time_picker
      f.input :end_datetime,  as: :date_time_picker
      f.input :length_of_students
    end
    f.actions
  end
end
