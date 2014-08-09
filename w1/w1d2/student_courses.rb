class Student
  
  def initialize(first, last)
    @first = first
    @last = last
    @courses = []
  end
  
  attr_reader :courses
  
  def name
    @first + " " + @last
    # "#{@first} #{@last}"
  end
  
  def courses
    @courses
  end
  
  def enroll(course)
    @courses << course
    course.students << self
  end
  
  def has_conflict?(new_course)
    self.courses.each do |course|
      return true if course.conflicts_with?(new_course)
    end
    false
  end
  
  def course_load
    load = Hash.new(0)
    self.courses.each do |course|
      load[course.dept] += course.credits
    end
    load
  end
end

class Course
  
  def initialize(course_name, dept, credits, day, time)
    @course_name = course_name
    @dept = dept
    @credits = credits
    @students = []
    @day = day
    @time = time
  end
  
  attr_reader :credits, :dept, :students
  
  def add_student(student)
    student.enroll(self)
  end
  
  def conflicts_with?(course)
    return true if self.day == course.day && self.time == course.time
    false
  end
  
end
# science = Course.new("science", "sci", 4)
# stud.enroll science