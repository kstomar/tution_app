ActiveAdmin.register RequestCourse do
  permit_params :user_id, :course_id, :status
end
