require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')


10.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email
  )
end

3.times do
  Project.create(
    name: Faker::SiliconValley.app,
    description: Faker::SiliconValley.motto
  )
end

user_ids = [1,2,3,4,5,6,7,8,9,10]
project_ids = [1,2,3]

3.times do |i|
  4.times do
    Assignment.create(
      user_id: user_ids.sample,
      project_id: project_ids[i]
    )
  end
end

#Tasks

6.times do
  Task.create(
    name: Faker::SiliconValley.invention,
    description: Faker::SiliconValley.quote,
    user_id: user_ids.sample,
    project_id: project_ids.sample,
  )
end
