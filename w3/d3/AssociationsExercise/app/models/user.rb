class User < ActiveRecord::Base
  has_many(
    :enrollments,
    class_name: "Enrollment",
    foreign_key: :student_id,
    primary_key: :id
  )
  
  has_many(
    :enrolled_courses, # Method name
    through: :enrollments, # has_many method name (from above)
    source: :course # From belongs_to in Course class
  )
end
