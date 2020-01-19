class User < ApplicationRecord
  has_many :enrollments,
    primary_key: :id, 
    foreign_key: :student_id, 
    class_name: :Enrollment 

    has_many :courses, 
      through: :enrollments, 
      source: :course

    has_many :instructing_courses, 
      primary_key: :id,
      foreign_key: :instructor_id, 
      class_name: :Course

end
