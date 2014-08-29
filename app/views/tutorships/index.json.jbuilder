json.array!(@tutorships) do |tutorship|
  json.extract! tutorship, :id, :tutor_id, :student_id, :accepted, :created_by_student, :message, :subject_id
  json.url tutorship_url(tutorship, format: :json)
end
