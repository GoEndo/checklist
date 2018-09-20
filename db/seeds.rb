# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "Go Endo",
             email: "go_endo@optum.com",
             password:              "Mckess01",
             password_confirmation: "Mckess01",
             role: "admin")

User.create!(name:  "Mike Harwerth",
             email: "mike_harwerth@optum.com",
             password:              "Mckess01",
             password_confirmation: "Mckess01")

Sprint.create(name: "Sprint 18-4-1 1",
              start: DateTime.strptime("09/02/2018 00:00", "%m/%d/%Y %H:%M"),
              duration: 14)

Sprint.create(name: "Sprint 18-4-1 1",
              start: DateTime.strptime("09/16/2018 00:00", "%m/%d/%Y %H:%M"),
              duration: 14)

Sprint.create(name: "Sprint 18-4-1 1",
              start: DateTime.strptime("09/30/2018 00:00", "%m/%d/%Y %H:%M"),
              duration: 14)

Team.create(name:"The ATeam")

Team.create(name:"Fast and Furious")

Team.create(name:"Gladiators")

Task.create(name:"Merge develop to team")

Task.create(name:"Merge team to develop")

Task.create(name:"Do everything else")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end