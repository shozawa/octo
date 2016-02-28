99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password: password,
               encrypted_password: password,
               confirmed_at: Time.zone.now)
end

10.times do |n|
  name = "テストPJ#{n+1}"
  Project.create!(name:  name)
end

10.times do |n|
  ProjectUser.create!(project_id: "1",
                      user_id: "#{n+1}")
end

10.times do |n|
  ProjectUser.create!(project_id: "2",
                      user_id: "#{n+1}")
end
