FactoryGirl.define do

  names = []
  10.times { names << Faker::Superhero.name }

  descriptions = []
  10.times { descriptions << Faker::Superhero.descriptor }

  tags = []
  10.times { tags << Faker::Superhero.power }

  sequence :name do |n|
    names[n-1]
  end

  sequence :description do |n|
    descriptions[n-1]
  end

  sequence :user_id do |n|
    n
  end

  sequence :tag_list do |n|
    two = []
    two << tags.shuffle[n-1]
    two << tags.shuffle[n-1]
    two
  end

  factory :task do
    name
    description
    start_date Date.today
    end_date Date.today + 365
    monday true
    tuesday true
    wednesday true
    thursday true
    friday true
    saturday true
    sunday true
    tag_list
    user_id
  end

end
