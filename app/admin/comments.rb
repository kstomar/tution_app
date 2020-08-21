ActiveAdmin.register Course do
  permit_params :title, :content, :start_datetime, :end_datetime, :length_of_students
end
