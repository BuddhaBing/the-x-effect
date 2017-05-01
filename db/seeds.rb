# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'database_cleaner'
require 'faker'
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

# FactoryGirl.create_list(:user, 10)
FactoryGirl.create(:user, username: "Rob Brentnall", email: "test@test.com", password: "123456", password_confirmation: "123456")
FactoryGirl.create_list(:task, 10, user_id: User.first.id)

Task.all.each do |task|
  FactoryGirl.create_list(:active_date, 365, task: task)
end
