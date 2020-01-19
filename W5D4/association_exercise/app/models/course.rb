class Course < ApplicationRecord
  has_many :enrollments, 
    primary_key: :id,
    foreign_key: :course_id,
    class_name: :Enrollment

  has_many :users,
    through: :enrollments,
    source: :user

  
    belongs_to :prerequisite_class,
    primary_key: :id,
    foreign_key: :prereq_id, 
    class_name: :Course, 
    optional: true
  
    belongs_to :instructor,
      primary_key: :id, 
      foreign_key: :instructor_id, 
      class_name: :User
    
    has_many :subsequent_classes,
    primary_key: :id,
    foreign_key: :prereq_id, 
    class_name: :Course

end
