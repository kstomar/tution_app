FactoryBot.define do
  factory :comment do
    comment { "Nice" }
    user_id { user_id }
    course_id { course_id }
  end
end
