FactoryBot.define do
  factory :request_course do
    status { "pending" }
    user_id { user_id }
    course_id { course_id }
  end
end
