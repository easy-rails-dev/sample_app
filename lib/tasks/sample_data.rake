namespace :db do
  desc "Заполнение бд данными"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  User.create!(name: "Test ADMIN",
               email: "easy.rails.dev@gmail.com",
               password: "mettal57",
               password_confirmation: "mettal57",
               admin: true)
  99.times do |n|
    name = Faker::Name.name
    email = "examole-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name: name, email: email, password: password, password_confirmation: password)
  end
end

def make_microposts
  users = User.all().limit(6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each { |followed| user.follow!(followed)}
  followers.each { |follower| follower.follow!(user) }
end