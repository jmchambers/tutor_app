jon   = User.create!(name: "Jon",   email: "jon@jon.com")
tim   = User.create!(name: "Tim",   email: "tim@tim.com")
gerry = User.create!(name: "Gerry", email: "gerry@gerry.com")

ruby_on_rails       = Subject.create!(name: "Ruby on Rails")
french              = Subject.create!(name: "French")
project_management  = Subject.create!(name: "Project Management")

# tim asks jon to tutor him in RoR
jon.pending_invites_to_be_a_tutor.create!(student: tim, subject: ruby_on_rails, message: "How do I RoR?")

# jon asks gerry to tutor him in French
gerry.pending_invites_to_be_a_tutor.create!(student: jon, subject: french, message: "How do I speak in your filthy language?")

# gerry asks tim to tutor him in Project Managament
tim.pending_invites_to_be_a_tutor.create!(student: gerry, subject: project_management, message: "How does le KanBan work?")

# jon accepts tim's invite
jon.pending_invites_to_be_a_tutor.first.update accepted: true

# gerry rejects jons's invite
gerry.pending_invites_to_be_a_tutor.first.update accepted: false

# to verify...
[jon, tim, gerry].each do |user|
  user.reload
  puts "\n\n"
  puts "#{user.name} has the following invites to be a tutor: #{user.pending_invites_to_be_a_tutor.map { |i| "from #{i.student.name}: #{i.message}" }}"
  puts "#{user.name} has rejected the following invites to be a tutor: #{user.rejected_invites_to_be_a_tutor.map { |i| "from #{i.student.name}: #{i.message}" }}"
  puts "#{user.name} is tutoring the following students: #{user.tutorships_as_tutor.map { |t| "#{t.student.name} (in #{t.subject.name})" }}"
end