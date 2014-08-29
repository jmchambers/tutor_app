class Tutorship < ActiveRecord::Base
  # rails g scaffold tutorship tutor:references student:references accepted:boolean created_by_student:boolean message:text subject:references

  belongs_to :tutor, class_name: "User"
  belongs_to :student, class_name: "User"
  belongs_to :subject

  # scopes defined as class methods (using fancy pants syntax: class << self do end)
  class << self

    def accepted
      where(accepted: true)
    end

    def rejected
      where(accepted: false)
    end

    def pending
      where("tutorships.accepted IS NULL")
    end

    def pending_invites_from_student
      pending.where(created_by_student: true)
    end

    def pending_invites_from_tutor
      pending.where(created_by_student: false)
    end

    def rejected_invites_from_student
      rejected.where(created_by_student: true)
    end

    def rejected_invites_from_tutor
      rejected.where(created_by_student: false)
    end

  end 
end
