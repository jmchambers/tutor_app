class Subject < ActiveRecord::Base
  # rails g scaffold subject name:string
  has_many :tutorships
end
