FactoryGirl.define do

  names = []
  10.times { names << Faker::Name.unique.name }

  sequence :username do |n|
    names[n-1]
  end

  sequence :email do |n|
    "email-#{n}@example.com"
  end

  factory :user do
    username
    email
    password "somethingsecure"
  end
end
