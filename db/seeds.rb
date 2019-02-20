# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
User.destroy_all
Project.destroy_all
Testmodule.destroy_all

5.times do |index|
  user = User.create(email: "user-#{index}@user.com", password: 'password', password_confirmation: 'password')

  25.times do
    project = Project.create(title: Faker::Commerce.product_name, content: Faker::Lorem.sentence, user_id: user.id)

    15.times do
      testmodule = Testmodule.create(title: Faker::Commerce.product_name, content: Faker::Lorem.sentence, project_id: project.id)

      10.times do
        Testcase.create(title: Faker::Commerce.product_name, body: Faker::Lorem.sentence, testmodule_id: testmodule.id)
      end

    end

  end
end
