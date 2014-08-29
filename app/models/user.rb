class User < ActiveRecord::Base

  # rails g scaffold email:string name:string

  # established tutorships where this user is the tutor
  has_many  :tutorships_as_tutor,
              ->{ Tutorship.accepted },
              class_name: "Tutorship",
              foreign_key: :tutor_id

  # established tutorships where this user is the student
  has_many  :tutorships_as_student,
              ->{ Tutorship.accepted },
              class_name: "Tutorship",
              foreign_key: :student_id

  # invites from student asking this user to be a tutor
  has_many  :pending_invites_to_be_a_tutor,
              ->{ Tutorship.pending_invites_from_student },
              class_name: "Tutorship",
              foreign_key: :tutor_id

  # invites from tutor asking this user to be a student
  has_many  :pending_invites_to_be_a_student, 
              ->{ Tutorship.pending_invites_from_tutor },
              class_name: "Tutorship",
              foreign_key: :student_id

  # rejected invites from student asking this user to be a tutor
  has_many  :rejected_invites_to_be_a_tutor,
              ->{ Tutorship.rejected_invites_from_student },
              class_name: "Tutorship",
              foreign_key: :tutor_id

  # rejected invites from tutor asking this user to be a student
  has_many  :rejected_invites_to_be_a_student,
              ->{ Tutorship.rejected_invites_from_tutor },
              class_name: "Tutorship",
              foreign_key: :student_id

  has_many  :tutors,
              class_name: "User",
              through: :tutorships_as_student

  has_many  :students,
              class_name: "User",
              through: :tutorships_as_tutor
  
end
