namespace :db do
  desc "Заполнение бд данными"
  task populate: :environment do
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
end