class Course < ActiveRecord::Base
  has_many(
    :enrollments,
    class_name: "Enrollment",
    foreign_key: :course_id,
    primary_key: :id
  )
  
  has_many(
    :enrolled_students, # Method name
    through: :enrollments, # has_many method name (from above)
    source: :user # From belongs_to in User class
  )
  
  #displays prerequisite. has_one displays course for which this course is a pre-req
  belongs_to( 
    :prerequisite,
    class_name: "Course",
    foreign_key: :prereq_id,
    primary_key: :id
  )
  
  belongs_to(
    :instructor,
    class_name: "User",
    foreign_key: :instructor_id, # Foreign Key for Course
    primary_key: :id # PK for User 
  )
end
