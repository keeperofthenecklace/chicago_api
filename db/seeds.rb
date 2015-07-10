require 'faker'

user = User.create(email: 'test@test.com', first_name: 'Taylor', last_name: 'Swift', username: 'summer', password: 'password', password_confirmation: 'password')

10.times do
  User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Internet.user_name, password: 'password')
end

10.times do
  Event.create(title: Faker::Name.title, event_begins_at: Date.today.beginning_of_week, event_ends_at: Date.today.end_of_month, user_id: user.id)
end

